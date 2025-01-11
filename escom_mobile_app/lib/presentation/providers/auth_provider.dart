import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserState {
  final bool isLoggedIn;
  final bool isStudent;
  final bool isTeacher;

  UserState({
    required this.isLoggedIn,
    required this.isStudent,
    required this.isTeacher,
  });

  UserState copyWith({
    bool? isLoggedIn,
    bool? isStudent,
    bool? isTeacher,
  }) {
    return UserState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isStudent: isStudent ?? this.isStudent,
      isTeacher: isTeacher ?? this.isTeacher,
    );
  }
}

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier() : super(UserState(isLoggedIn: false, isStudent: false, isTeacher: false));

  void logInAsStudent() {
    state = state.copyWith(isLoggedIn: true, isStudent: true, isTeacher: false);
  }

  void logInAsTeacher() {
    state = state.copyWith(isLoggedIn: true, isStudent: false, isTeacher: true);
  }

  void logOut() {
    state = state.copyWith(isLoggedIn: false, isStudent: false, isTeacher: false);
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) => UserNotifier());
