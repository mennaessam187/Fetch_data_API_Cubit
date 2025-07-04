import 'package:equatable/equatable.dart';

class postState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class postLoading extends postState {}

class postLoaded extends postState {
  final List Post;

  postLoaded({required this.Post});
  List<Object?> get props => [Post];
}

class postError extends postState {
  final String message;

  postError({required this.message});
  List<Object?> get props => [message];
}
