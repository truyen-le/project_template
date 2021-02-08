import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// {@template user}
/// User model
///
/// [User.empty] represents an unauthenticated user.
/// {@endtemplate}
class User extends Equatable {
  /// {@macro user}
  const User({
    @required this.email,
    @required this.uid,
    @required this.displayName,
    @required this.photoURL,
  })  : assert(email != null),
        assert(uid != null);

  /// The current user's email address.
  final String email;

  /// The current user's id.
  final String uid;

  /// The current user's name (display name).
  final String displayName;

  /// Url for the current user's photo.
  final String photoURL;

  /// Empty user which represents an unauthenticated user.
  static const empty =
      User(email: '', uid: '', displayName: null, photoURL: null);

  @override
  List<Object> get props => [email, uid, displayName, photoURL];
}
