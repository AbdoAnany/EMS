//@dart=2.9
import 'dart:async';
import 'dart:collection';
import 'dart:math' as math;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

enum GroupedListOrder {  asc,  desc }

class GroupedListView<T, E> extends StatefulWidget {
  final List<T> elements;
  final E Function(T element) groupBy;
  final int Function(E value1, E value2) groupComparator;
  final int Function(T element1, T element2) itemComparator;
  final Widget Function(E value) groupSeparatorBuilder;

  final Widget Function(T element) groupHeaderBuilder;

  final Widget Function(BuildContext context, T element) itemBuilder;

  final Widget Function(BuildContext context, T element, int index)
  indexedItemBuilder;

  final GroupedListOrder order;
  final bool sort;

  final bool useStickyGroupSeparators;
  final Widget separator;
  final bool floatingHeader;

  final Color stickyHeaderBackgroundColor;
  final ScrollController controller;

  final Axis scrollDirection;
  final bool primary;

  final ScrollPhysics physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry padding;

  final bool reverse;

  final bool addAutomaticKeepAlive;

  final bool addRepaintBoundaries;

  final bool addSemanticIndexes;

  final double cacheExtent;

  final Clip clipBehavior;
  final DragStartBehavior dragStartBehavior;

  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String restorationId;
  final int semanticChildCount;

  final double itemExtent;

  const GroupedListView({
    Key key,
    this.elements,
    this.groupBy,
    this.groupComparator,
    this.groupSeparatorBuilder,
    this.groupHeaderBuilder,
    this.itemBuilder,
    this.indexedItemBuilder,
    this.itemComparator,
    this.order = GroupedListOrder. asc,
    this.sort = true,
    this.useStickyGroupSeparators = false,
    this.separator = const SizedBox.shrink(),
    this.floatingHeader = false,
    this.stickyHeaderBackgroundColor = const Color(0xffF7F7F7),
    this.scrollDirection = Axis.vertical,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.reverse = false,
    this.addAutomaticKeepAlive = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.clipBehavior = Clip.hardEdge,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.dragStartBehavior = DragStartBehavior.start,
    this.restorationId,
    this.semanticChildCount,
    this.itemExtent,
  })  : assert(itemBuilder != null || indexedItemBuilder != null),
        assert(groupSeparatorBuilder != null || groupHeaderBuilder != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _GroupedListViewState<T, E>();
}

class _GroupedListViewState<T, E> extends State<GroupedListView<T, E>> {
  final StreamController<int> _streamController = StreamController<int>();
  final LinkedHashMap<String, GlobalKey> _keys = LinkedHashMap();
  final GlobalKey _key = GlobalKey();
  final ScrollController _controller = ScrollController();
  GlobalKey _groupHeaderKey;
  List<T> _sortedElements = [];
  int _topElementIndex = 0;
  RenderBox _headerBox;
  RenderBox _listBox;

  I _ambiguate<I>(I value) => value;

  @override
  void initState() {
    if (widget.useStickyGroupSeparators) {
      _controller.addListener(_scrollListener);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.useStickyGroupSeparators) {
      _controller.removeListener(_scrollListener);
    }
    if (widget.controller == null) {
      _controller.dispose();
    }
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _sortedElements = _sortElements();
    var hiddenIndex = widget.reverse ? _sortedElements.length * 2 - 1 : 0;
    var isSeparator = widget.reverse ? (int i) => i.isOdd : (int i) => i.isEven;
    if (widget.reverse) {
      _ambiguate(WidgetsBinding.instance).addPostFrameCallback((_) {
        _scrollListener();
      });
    }
    return Stack(
      key: _key,
      alignment: Alignment.topCenter,
      children: <Widget>[
        ListView.builder(
          key: widget.key,
          scrollDirection: widget.scrollDirection,
          controller: _controller,
          primary: widget.primary,
          physics: widget.physics,
          shrinkWrap: widget.shrinkWrap,
          padding: widget.padding,
          reverse: widget.reverse,
          clipBehavior: widget.clipBehavior,
          dragStartBehavior: widget.dragStartBehavior,
          itemExtent: widget.itemExtent,
          restorationId: widget.restorationId,
          keyboardDismissBehavior: widget.keyboardDismissBehavior,
          semanticChildCount: widget.semanticChildCount,
          itemCount: _sortedElements.length * 2,
          addAutomaticKeepAlives: widget.addAutomaticKeepAlive,
          addRepaintBoundaries: widget.addRepaintBoundaries,
          addSemanticIndexes: widget.addSemanticIndexes,
          cacheExtent: widget.cacheExtent,
          itemBuilder: (context, index) {
            var actualIndex = index ~/ 2;
            if (index == hiddenIndex) {
              return Opacity(
                opacity: widget.useStickyGroupSeparators ? 0 : 1,
                child: _buildGroupSeparator(_sortedElements[actualIndex]),
              );
            }
            if (isSeparator(index)) {
              var curr = widget.groupBy(_sortedElements[actualIndex]);
              var prev = widget.groupBy(
                  _sortedElements[actualIndex + (widget.reverse ? 1 : -1)]);
              if (prev != curr) {
                return _buildGroupSeparator(_sortedElements[actualIndex]);
              }
              return widget.separator;
            }
            return _buildItem(context, actualIndex);
          },
        ),
        StreamBuilder<int>(
            stream: _streamController.stream,
            initialData: _topElementIndex,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _showFixedGroupHeader(snapshot.data);
              }
              return Container();
            }),
      ],
    );
  }

  Widget _buildItem(context, int index) {
    final key = _keys.putIfAbsent('$index', () => GlobalKey());
    final value = _sortedElements[index];
    return KeyedSubtree(
      key: key,
      child: widget.indexedItemBuilder != null
          ? widget.indexedItemBuilder(context, value, index)
          : widget.itemBuilder(context, value),
    );
  }

  void _scrollListener() {
    _listBox = _key.currentContext.findRenderObject() as RenderBox;
    var listPos = _listBox.localToGlobal(Offset.zero).dy ?? 0;
    _headerBox = _groupHeaderKey.currentContext.findRenderObject() as RenderBox;
    var headerHeight = _headerBox.size.height ?? 0;
    var max = double.negativeInfinity;
    var topItemKey = widget.reverse ? '${_sortedElements.length - 1}' : '0';
    for (var entry in _keys.entries) {
      var key = entry.value;
      if (_isListItemRendered(key)) {
        var itemBox = key.currentContext.findRenderObject() as RenderBox;
        // position of the item's top border inside the list view
        var y = itemBox.localToGlobal(Offset(0, -listPos - headerHeight)).dy;
        if (y <= headerHeight && y > max) {
          topItemKey = entry.key;
          max = y;
        }
      }
    }
    var index = math.max(int.parse(topItemKey), 0);
    if (index != _topElementIndex) {
      var curr = widget.groupBy(_sortedElements[index]);
      E prev;
      try {
        prev = widget.groupBy(_sortedElements[_topElementIndex]);
      } on RangeError catch (_) {
        prev = widget.groupBy(_sortedElements[0]);
      }
      if (prev != curr) {
        _topElementIndex = index;
        _streamController.add(_topElementIndex);
      }
    }
  }

  List<T> _sortElements() {
    var elements = [...widget.elements];
    if (widget.sort && elements.isNotEmpty) {
      elements.sort((e1, e2) {
        int compareResult;
        // compare groups
        if (widget.groupComparator != null) {
          compareResult =
              widget.groupComparator(widget.groupBy(e1), widget.groupBy(e2));
        } else if (widget.groupBy(e1) is Comparable) {
          compareResult = (widget.groupBy(e1) as Comparable)
              .compareTo(widget.groupBy(e2) as Comparable);
        }
        // compare elements inside group
        if (compareResult == null || compareResult == 0) {
          if (widget.itemComparator != null) {
            compareResult = widget.itemComparator(e1, e2);
          } else if (e1 is Comparable) {
            compareResult = e1.compareTo(e2);
          }
        }
        return compareResult;
      });
      if (widget.order == GroupedListOrder. desc) {
        elements = elements.reversed.toList();
      }
    }
    return elements;
  }

  Widget _showFixedGroupHeader(int topElementIndex) {
    _groupHeaderKey = GlobalKey();
    if (widget.useStickyGroupSeparators && _sortedElements.isNotEmpty) {
      T topElement;
      try {
        topElement = _sortedElements[topElementIndex];
      } on RangeError catch (_) {
        topElement = _sortedElements[0];
      }
      return Container(
        key: _groupHeaderKey,
        color:
        widget.floatingHeader ? null : widget.stickyHeaderBackgroundColor,
        width: widget.floatingHeader ? null : MediaQuery.of(context).size.width,
        child: _buildGroupSeparator(topElement),
      );
    }
    return Container();
  }

  bool _isListItemRendered(GlobalKey<State<StatefulWidget>> key) {
    return key.currentContext != null &&
        key.currentContext.findRenderObject() != null;
  }

  Widget _buildGroupSeparator(T element) {
    if (widget.groupHeaderBuilder == null) {
      return widget.groupSeparatorBuilder(widget.groupBy(element));
    }
    return widget.groupHeaderBuilder(element);
  }
}
