part of 'search_page.dart';

final class _SearchView extends StatelessWidget {
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Search Your Summoner", style: TextTheme.of(context).headlineMedium),

              TextField(onChanged: cubit.onChangeName),
              TextField(onChanged: cubit.onChangeTag),

              ElevatedButton(
                onPressed: cubit.isValidToSubmit ? cubit.submit : null,
                child: const Text('Search Summoner'),
              ),

              BlocSelector<SearchCubit, SearchState, List<Account>>(
                selector: (state) => state.savedAccounts ?? [],
                builder: (context, state) {
                  if (state.isNotEmpty) {
                    return Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text("Previous searches"),
                            trailing: IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                // TODO: Evaluate what could be done here
                              },
                            ),
                          ),
                          ...state.map(
                            (account) => ListTile(
                              title: Text(account.gameName),
                              subtitle: Text('#${account.tagLine}'),
                              trailing: Text(account.region.code),
                              onTap: () {
                                cubit.selectAccount(account);
                                Navigator.of(context).push(ProfilePage.route());
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return const Icon(Icons.no_transfer_outlined, size: 50);
                },
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
            ).showSnackBar(const SnackBar(content: Text('Error fetching the Summoner')));
          }
        },
      ),
    );
  }
}
