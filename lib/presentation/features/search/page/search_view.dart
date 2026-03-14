part of 'search_page.dart';

final class _SearchView extends StatelessWidget {
  const _SearchView();

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);
    final intl = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: BlocListener<SearchFormCubit, SearchFormState>(
          listener: (context, state) {
            if (state.status == .error) {
              ScaffoldMessenger.of(context)
                ..clearSnackBars()
                ..showSnackBar(
                  SnackBar(content: Text(state.message ?? intl.general_error)),
                );
            }

            if (state.status.isSuccess) {
              Navigator.of(context).pushNamed(ProfilePage.routeName);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 12,
              children: [
                const Icon(Icons.person_search, size: 64),
                Text(intl.search_title, style: textTheme.displayMedium),

                const _SearchForm(),

                Divider(color: colorScheme.primary),

                Expanded(
                  child: BlocBuilder<RecentAccountsCubit, RecentAccountsState>(
                    builder: (context, state) {
                      return Column(
                        spacing: 8,
                        mainAxisSize: .min,
                        mainAxisAlignment: .center,
                        crossAxisAlignment: .start,
                        children: [
                          Text(intl.search_recent_accounts, style: textTheme.titleMedium),

                          if (state.status.isLoading)
                            const Center(child: CircularProgressIndicator.adaptive()),

                          if (state.status.isSuccess || state.recentAccounts.isNotEmpty)
                            Expanded(
                              child: ListView.builder(
                                itemCount: state.recentAccounts.length,
                                itemBuilder: (context, index) {
                                  final account = state.recentAccounts.elementAt(index);

                                  return ListTile(
                                    leading: CircleAvatar(
                                      child: CachedNetworkImage(
                                        imageUrl: account.iconUrl,
                                      ),
                                    ),
                                    title: Text(account.riotID),
                                    subtitle: Text(account.region.name.toUpperCase()),
                                    onTap: () {
                                      debugPrint('Navigating to Profile with $account');

                                      final cubit = context.read<SearchFormCubit>();

                                      if (!cubit.state.status.isLoading) {
                                        cubit.searchWithPUUID(account.puuid);
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
