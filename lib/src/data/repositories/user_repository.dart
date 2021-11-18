import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:news_ai/src/core/constants/constants.dart';

class UserRepository {
  Client client = Client();
  Account account = Account(Client());

  UserRepository() {
    client
        .setEndpoint(AppwriteServer.apiEndpoint)
        .setProject(AppwriteServer.projectID);
    account = Account(client);
  }

  Future<Session> signInWithCredentials(String email, String password) async {
    return await account.createSession(email: email, password: password);
  }

  Future<User> signUp(String name, String email, String password) async {
    return await account.create(name: name, email: email, password: password);
  }

  Future<void> signOut() async {
    return await account.deleteSession(sessionId: 'current');
  }

  Future<bool> isSignedIn() async {
    var response = await account.get().then((value) {
      final currentUser = User.fromMap(value.toMap());
      return currentUser != null;
    }).catchError((error) {
      const currentUser = null;
      return currentUser == null;
    });
    return false;
  }

  Future<User> getUser() async {
     return await account.get();
  }

}
