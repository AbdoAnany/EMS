

class URLS {
  static final String appVersion = "0.0.35";

  //static final String BaseURL = "http://10.1.245.1:9876/MyGlcSystem/";

  static final String Login = "Login";
  static final String LoginBarcode = "BarcodeAPI/Login";


  static final String APIFileOperation = "GeneralAPI";

  static final String APIFileOperation1 = "API/GeneralAPI";
  static final String BarcodeFileOperation = "BarcodeAPI";


  // static final String BaseURL = "https://ticket.glcpaints.com:9877/MyGlcSystem/";
  static final String BaseURL = "https://myglc-api.glcpaints.com:7003/MyGlcSystem/";

  static final String BaseURL1 = "http://10.1.245.1:9010/";



  // static final String sendEmail = "https://ticket.glcpaints.com:1984/Email/SendMail";
  static final String sendEmail = "https://myglc-api.glcpaints.com:1984/Email/SendMail";


  // For Test
  // static final String APIAttachment = "https://ticket.glcpaints.com:4568/Dropbox/UploadFile";
  // static final String APIDownloadFile = "https://ticket.glcpaints.com:4568/Dropbox/DownloadAttacment?FileName=";
  // static final String APIDisplayPhoto = "https://ticket.glcpaints.com:4568/Dropbox/DisplayPhoto?FileName=";
  // static final String APICheckFileExist =  "https://ticket.glcpaints.com:4568/Dropbox/CheckFileExist?FileName=";

  // For Publish
  // static final String APIAttachment = "https://ticket.glcpaints.com:4567/Dropbox/UploadFile";
  // static final String APIDownloadFile = "https://ticket.glcpaints.com:4567/Dropbox/DownloadAttacment?FileName=";
  // static final String APIDisplayPhoto = "https://ticket.glcpaints.com:4567/Dropbox/DisplayPhoto?FileName=";
  // static final String APICheckFileExist =  "https://ticket.glcpaints.com:4567/Dropbox/CheckFileExist?FileName=";


  static final String APIAttachment = "https://myglc-api-local.glcpaints.com:7002/FileManager/Local/Upload";
  static final String APIDownloadFile = "https://myglc-api-local.glcpaints.com:7001/FileManager/Local/Download?fileID=";
  static final String APIDisplayPhoto = "https://myglc-api-local.glcpaints.com:7001/FileManager/Local/Display?fileID=";
  static final String APICheckFileExist =  "https://myglc-api-local.glcpaints.com:7001/FileManager/Local/CheckFileExist?fileID=";
}
