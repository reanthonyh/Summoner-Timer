part of 'search_page.dart';

final class _SearchView extends StatefulWidget {
  @override
  State<_SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<_SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SearchCubit, SearchState>(
        builder: (context, state) {
          final cubit = context.read<SearchCubit>();

          if (state.status == .loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            spacing: 16,
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              Text("Search Your Summoner", style: TextTheme.of(context).headlineMedium),

              TextField(onChanged: cubit.onChangeName),
              TextField(onChanged: cubit.onChangeTag),

              ElevatedButton(
                onPressed: cubit.isValidToSubmit ? cubit.submit : null,
                child: const Text("Search Summoner"),
              ),
            ],
          );
        },
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == UiStatus.success && state.account != null) {
            Navigator.of(context).push(ProfilePage.route());
          }

          if (state.status == UiStatus.error) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Error fetching the Summoner")));
          }
        },
      ),
    );
  }
}
