/**
 * Created by Imtiyazaehmad Parasara.
 * Date: 11/01/24
 */

import 'package:dio/dio.dart';
import 'package:gsheets/gsheets.dart';

abstract class AddDataApiServices {
  Future<Worksheet?> googleSheetClient(String sheetTitle);

}

class AddDataApiServicesImpl implements AddDataApiServices {
  GSheets? gSheets;
  String spreadsheetId = '1oFudEnuAKdjD-1NjHc8zIWzOyY25cM7Z2ninJhKUnpE';
  var credentials = r'''
{
  "type": "service_account",
  "project_id": "financial-tracking-daily",
  "private_key_id": "4acb675e7f6047b4f107a3a3ccbe7cbe9e7fcccb",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCv5Nt4HECVxUT7\nROc2CFoBN/QemDMJNudVsfxrLQ8sXDZplncf/QnBuuWzQty186oYxNENkADn2Jsd\ngvOIkwVcNrA3WQj7jOdDIH/FclEN/e8/gSfEMfFWjSPmRdGhhPwmCaxh/wCmK57Q\n0layl9zJYZnlVB3gmaUFjke4F234w36yheGMQoZ4JN1b9cva447Z+6c25s25i/CT\n/+4yCo8FqnxJ9uiE69nYO6BgfV/Pb1woWRv37MZgPL/javxWllHZki/TJ968lsB8\n5SoQxwPSHAyfCKSc37+XKqHl8FoCf+NwV9B/wYRUbViAQ6jvJkgrsZegyumJ3j24\nr/ermY1PAgMBAAECggEARUCa9FhTSWSI+1Euo0R4g2BPWjhcZ7VZMZFJK71q6vFH\nbx0Ru+N5kvAN/h1GHtFX2DathGR9JstOjzj+v3f7NUpG6RPCCKB6cSB7jfarWRHw\nv5UPXhy3w3cAempk1e4xBJzsZQzsaYBlIBygi+JkyFkIKZWLyeFUarKRJDb9UmKl\nyyrpTwLlYCFwbssxQVO2DqHMF9GaSy4liS4x4cOsqZ2HXEWz7JE4zsI7xsxbRMbH\nlXgKQLzRxKPM94Dkzz3ouFWE6t9QFtf8B6b4Op6cQLF7Hj9dTf1M6YxQ5cjDhoN5\n18hpweFMKOs69UPNAiIxnHJmSNrd3C6MnOWRBLGm4QKBgQDvpZyY/EYHV6eEfJ9u\nd7Sa374kuegrCo6i+TsDm3+1kbU1TrDR95nPbWUrrLCHLESxrCJz7gRuXBzaLPHS\nuxQjJl5Vkf2A4fR5GyveZtQt/OFj5EUySNDXtCfFxruWKfhnYLlwaWomjjTDFDMw\nBadn41W6fMUIZ3PNB1glPxwbsQKBgQC75YvektyJQZ5oyzh7NK63UKqY8awoi1Pt\n1zZs9vFAzPDLBsWf8ybKN3Rq/TJj7nWJ5CSkXC83fUxMlYGQEtXKMc5lAqYgKWN/\neHkx7piIWrGHRIGiCVg5sxQ3vo5P1T7JmoE4m36vIw+ZkwIIuO2/3QKOAXSfxbJp\nW0EA9k94/wKBgQDYHcQxeyA0MupRYons92saWDiDqlwjpKupcZW01SDAv5xpbIOt\ndttw4rjgQCYaYOO6Tv/rCHVaiRtD7lBOuIOah1l/Vd8Fwb/VD5nqQVWL+4fPq+Zz\nSJN+U2uiwmwdKdBoeiQBqi8eghQ28RqQbijgWXXQbgDKaXFXLw5g2J8ioQKBgF5a\noOg9+3z5dKDPHCfShsILQf/XrEoX3SecYPpK709JGsn5Nphhs+LsAgwP5ZQFFQUP\nic73c8Z7pyr2EL/WlYEZjblvoRiZcBt81e9bD0G5uVhh8G78Hk+rO8XabQBt5z+5\n1JYmj3FHO/g0uFrE8q7cPwIsfPIWhscdSgE/rxzlAoGBAKprSdPCS1lgeU2yVVzZ\nvy90Dh3SK8jQmNPv4fLOct4Pn5rk8u25vVvlwfBetVSv8jttF3b+Rocak0ePH3vY\nWydykVlujsfwJILCckHRzeAsCTgVNn3dCgnk39FusZKgSXSD9uAVtgjgxAmwiy2f\n5lUCSJPefWTUHXBQQJycIC3U\n-----END PRIVATE KEY-----\n",
  "client_email": "ftrackingdaily@financial-tracking-daily.iam.gserviceaccount.com",
  "client_id": "118216878398380677033",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/ftrackingdaily%40financial-tracking-daily.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
''';

  AddDataApiServicesImpl();

  @override
  Future<Worksheet?> googleSheetClient(String sheetTitle) async {
    gSheets = GSheets(credentials);
    final ss = await gSheets?.spreadsheet(spreadsheetId);
    final sheet = ss?.worksheetByTitle(sheetTitle);
    return sheet;
  }
}
