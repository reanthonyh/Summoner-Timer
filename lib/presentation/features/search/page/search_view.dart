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

          return SingleChildScrollView(
            child: Column(
              spacing: 12,
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [
                const Text("Search Your Summoner"),

                TextField(onChanged: cubit.onChangeName),
                TextField(onChanged: cubit.onChangeTag),

                ElevatedButton(
                  onPressed: cubit.isValidToSubmit ? cubit.submit : null,
                  child: const Text("Search Summoner"),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state.status == .success && state.account != null) {
            Navigator.of(context).pushReplacement(ProfilePage.route());
          }

          if (state.status == .error) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Error fetching the Summoner")));
          }
        },
      ),
    );
  }
}
