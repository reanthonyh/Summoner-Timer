part of 'search_page.dart';

final class _SearchView extends StatelessWidget {
  const _SearchView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final intl = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: BlocListener<SearchFormCubit, SearchFormState>(
          listener: (context, state) {
            if (state.status.isError) {
              ScaffoldMessenger.of(context)
                ..clearSnackBars()
                ..showSnackBar(
                  SnackBar(content: Text(state.message ?? intl.general_error)),
                );
            }

            if (state.status.isSuccess) {
              context.read<SearchFormCubit>().resetStatus();
              Navigator.of(context).pushNamed(ProfilePage.routeName);
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: AppSpacing.lg,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 16,
                    children: [
                      const Icon(Icons.person_search, size: 48),
                      Text(
                        intl.search_title,
                        style: textTheme.headlineLarge,
                        textAlign: TextAlign.center,
                      ),
                      const _SearchForm(),
                      Divider(color: colorScheme.primary),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        intl.search_recent_accounts,
                        style: textTheme.titleMedium,
                      ),
                    ),
                    BlocBuilder<RecentAccountsCubit, RecentAccountsState>(
                      builder: (context, state) {
                        if (state.status.isLoading && state.recentAccounts.isEmpty) {
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }

                        if (state.recentAccounts.isEmpty) {
                          return Center(
                            child: Column(
                              spacing: 16,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.history,
                                  size: 48,
                                  color: colorScheme.onSurfaceVariant.withValues(
                                    alpha: 0.5,
                                  ),
                                ),
                                Text(
                                  intl.search_no_recent_accounts,
                                  style: textTheme.bodyLarge?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          itemCount: state.recentAccounts.length,
                          itemBuilder: (context, index) {
                            final account = state.recentAccounts.elementAt(index);

                            return Card(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  child: CachedNetworkImage(imageUrl: account.iconUrl),
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
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
