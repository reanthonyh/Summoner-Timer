part of 'profile_page.dart';

final class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProfileCubit, ProfileState>(
        builder: (context, state) {
          // TODO: Implement the entire view widgets

          return Center(
            child: Text(state.account?.toString() ?? state.status.toString()),
          );
        },
        listener: _handleListener,
      ),
    );
  }

  void _handleListener(BuildContext context, ProfileState state) {
    switch (state.status) {
      case UiStatus.error:
        ScaffoldMessenger.of(context)
          ..clearSnackBars()
          ..showSnackBar(
            SnackBar(
              content: Text(state.message ?? "An error happend"),
              duration: Durations.extralong2,
            ),
          );
      default:
        break;
    }
  }
}
