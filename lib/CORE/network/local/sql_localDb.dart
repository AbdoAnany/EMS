// @dart=2.9

import 'dart:async';



var localDb;
Future createDB() async {
//  Directory directoryPath = await getApplicationDocumentsDirectory();
// String path = join(directoryPath.path, "HomeCubit.localDb");
   //localDb = await openDatabase('scanDb.db',version: 1,onUpgrade: (Database db, int oldVersion, int newVersion) {
    // if (oldVersion < newVersion) {
    //   db.transaction((txn) async => await txn.execute("ALTER TABLE HeaderOrderDB ADD ""COLUMN Transfer INTEGER;"));
    // }

 // });

  await  localDb.execute('CREATE TABLE IF NOT EXISTS HeaderOrderDB ('
      'CustomerNumber	INTEGER,'
      'OrderNumber	INTEGER,'
      'OrderState	INTEGER,'
      'StateName	TEXT,'
      'Transfer	INTEGER,'
      'CustomerName	TEXT,'
      'OrderDate	TEXT'
      ')');
  await  localDb.execute('CREATE TABLE IF NOT EXISTS LineOrderDB  ('
      'ItemDescription	TEXT,'
      'OrderNumber INTEGER,'
      'LineNumber INTEGER,'
      'Conversion	INTEGER,'
      'ItemCode	TEXT,'
      'StateName	TEXT,'
      'UnitOfMeasure	TEXT,'
      'Qty INTEGER,'
      'NotHasError INTEGER,'
      'Working INTEGER,'
      'Count INTEGER'
      ')');

  await  localDb
      .execute('CREATE TABLE IF NOT EXISTS LineOrderScanningDB ('
          'ScanningID TEXT PRIMARY KEY,'
          'Serial TEXT ,'
      'StateName	TEXT,'
      'NotHasError INTEGER,'
          'LotNumber TEXT,'
          'ItemDescription	TEXT,'
          'OrderNumber INTEGER,'
// 'UnitOfMeasure	TEXT,'
//  'Conversion	INTEGER,'
          'LineNumber INTEGER,'
          'ItemCode	TEXT'
//
// 'Qty INTEGER'
          ')');
}
Future<dynamic> selectOneLineOrderDB(int orderNumber ,int orderLineNumber ) async => await  localDb.rawQuery(
    'SELECT * FROM LineOrderScanningDB where OrderNumber = $orderNumber and LineNumber = $orderLineNumber');
Future<dynamic> selectOneLineOrderErrorDB(int orderNumber ,int orderLineNumber ) async => await  localDb.rawQuery(
    'SELECT * FROM LineOrderScanningDB where OrderNumber = $orderNumber and LineNumber = $orderLineNumber and NotHasError =${1}');


Future<dynamic> selectLineOrderDB({key="OrderNumber",where}) async => await  localDb.rawQuery(
    'SELECT * FROM LineOrderDB ${where != null ? "where $key=$where" : ''}');
Future<dynamic> selectWorkingLineOrderDB({where}) async => await  localDb.rawQuery(
    'SELECT OrderNumber,LineNumber,ItemCode,Count,Working FROM LineOrderDB  where Working = 1');
Future<dynamic> selectHeaderOrderDB({where}) async =>
    await  localDb.rawQuery(
        "SELECT * FROM HeaderOrderDB ${where != null ? "where OrderNumber=$where" : ''}");

Future<dynamic> selectAllOrderScanningDB({where}) async => await  localDb.rawQuery(
    'SELECT * FROM LineOrderScanningDB ');

Future<dynamic> selectOrderScanningDB(ScanningID) async =>await  localDb.rawQuery('SELECT * FROM LineOrderScanningDB where ScanningID = \'$ScanningID\'');
Future<dynamic> selectAllInOrderLineOrderScanningDB(OrderNumber) async =>await  localDb.rawQuery('SELECT * FROM LineOrderScanningDB where OrderNumber = \'$OrderNumber\'');


// Future <int>updateCountLineOrderDB({update, OrderItemModel item}) async =>
//     await  localDb.rawUpdate(
//         'UPDATE LineOrderDB SET Count = ? WHERE ItemCode = ? and OrderNumber = ? ',
//         [update, item.itemCode,item.orderNumber]);
// Future <int>updateWorkingLineOrderDB({update, OrderItemModel item}) async =>
//     await  localDb.rawUpdate(
//         'UPDATE LineOrderDB SET Working = ? WHERE ItemCode = ? and OrderNumber = ? ',
//         [update, item.itemCode,item.orderNumber]);
Future<int> updateHeaderOrderDB({update, orderNumber}) async =>
    await  localDb.rawUpdate(
        'UPDATE HeaderOrderDB SET StateName = ? WHERE OrderNumber = ?',
        [update, orderNumber]);
Future<int> updateTransferHeaderOrderDB({update, orderNumber}) async =>
    await  localDb.rawUpdate(
        'UPDATE HeaderOrderDB SET Transfer = ?,StateName=? WHERE OrderNumber = ?',
        [update,update==1?'Complete':'Partially', orderNumber]);
 Future updateNotHasErrorOrderScanningDB({stateName,notHasError,scanningID}) async =>    await  localDb.rawUpdate(
     'UPDATE LineOrderScanningDB SET StateName = ?,NotHasError = ? WHERE ScanningID = ?',
     [stateName,notHasError, scanningID]);
Future updateNotHasErrorOrderLineDB({stateName,notHasError,orderNumber,lineNumber}) async =>    await  localDb.rawUpdate(
    'UPDATE LineOrderDB SET StateName = ?,NotHasError = ? WHERE OrderNumber = ? and LineNumber = ?',
    [stateName,notHasError, orderNumber,lineNumber]);



//
// Future<int> insertLineOrderDB({OrderItemModel item, orderNumber}) async =>
//     await  localDb.rawInsert(
//         "INSERT INTO LineOrderDB (OrderNumber,LineNumber,ItemCode,ItemDescription,Conversion,Qty,Count,StateName,NotHasError)"
//         " VALUES (?,?,?,?,?,?,?,?,?)",
//         [
//           orderNumber,
//           item.lineNumber,
//           item.itemCode,
//           item.itemDescription,
//           item.conversion,
//           item.qty ?? 0,
//           item.count ?? 0,'none',0
//         ]);
// Future<int> insertHeaderOrderDB(CustomerOrderModel item) async =>
//     await  localDb.rawInsert(
//         "INSERT INTO HeaderOrderDB (CustomerNumber,OrderNumber,OrderState,CustomerName,OrderDate,StateName,Transfer)"
//         " VALUES (?,?,?,?,?,?,?)",
//         [
//           item.customerID,
//           item.orderNumber,
//           item.stateID,
//           item.customerName,
//           item.orderDate,
//           'New',0
//         ]);
// Future<int> insertOrderScanningDB({OrderItemModel item}) async =>
//     await  localDb.rawInsert(
//         "INSERT INTO LineOrderScanningDB "
//         "(ScanningID,OrderNumber,LineNumber,ItemCode,ItemDescription,LotNumber,Serial,StateName,NotHasError) "
//         "VALUES (?,?,?,?,?,?,?,?,?)",
//         [
//                 item.itemCode+  item.serial + item.lotNumber,
//           item.orderNumber,
//           item.lineNumber,
//           item.itemCode,
//           item.itemDescription,
// //   listItemInCustomerOrder[index].qty,
//           item.lotNumber,
//           item.serial,'none',0
//         ]);

Future countLineOrderDB({where}) async => await  localDb.rawQuery(
    'SELECT COUNT(*) FROM LineOrderDB ${where != null ? "where OrderNumber=$where" : ''}');
Future countHeaderOrderDB({where}) async => await  localDb.rawQuery(
    'SELECT COUNT(*) FROM HeaderOrderDB ${where != null ? "where OrderNumber=$where" : ''}');
Future countOrderScanningDB({where}) async => await  localDb.rawQuery(
    'SELECT COUNT(*) FROM LineOrderScanningDB ${where != null ? "where OrderNumber=$where" : ''}');
Future deleteLineOrderDB() async => await  localDb.delete('LineOrderDB');
Future deleteHeaderOrderDB() async => await  localDb.delete('HeaderOrderDB');
// Future deleteLineOrderScanningDB({OrderItemModel item}) async =>item!=null?
//     await  localDb.delete('LineOrderScanningDB', where: 'ScanningID=? ',whereArgs: [item.scanningID]):
// await  localDb.delete('LineOrderScanningDB',)
// ;
