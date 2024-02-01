import 'package:insta_cleanarchitecture/const.dart';
import 'package:insta_cleanarchitecture/features/domain/entity/user/userentity.dart';
import 'package:insta_cleanarchitecture/features/presentation/pages/credential/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:insta_cleanarchitecture/features/presentation/pages/post/updatepostpage.dart';
import 'package:insta_cleanarchitecture/features/presentation/pages/profile/editprofilepage.dart';

import 'features/presentation/pages/credential/signinpage.dart';
import 'features/presentation/pages/post/comment/commentpage.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case PageConst.editProfilePage:
        {
          if (args is UserEntity) {
            return routeBuilder(EditProfilePage(
              currentUser: args,
            ));
          } else {
            return routeBuilder(NoPageFound());
          }
        }
      case PageConst.updatePostPage:
        {
          return routeBuilder(UpdatePostPage());
        }
      case PageConst.commentPage:
        {
          return routeBuilder(CommentPage());
        }
      case PageConst.signInPage:
        {
          return routeBuilder(SignInPage());
        }
      case PageConst.signUpPage:
        {
          return routeBuilder(SignUpPage());
        }
      default:
        {
          NoPageFound();
        }
    }
  }
}

dynamic routeBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class NoPageFound extends StatelessWidget {
  const NoPageFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page not found"),
      ),
      body: Center(
        child: Text("Page not found"),
      ),
    );
  }
}
