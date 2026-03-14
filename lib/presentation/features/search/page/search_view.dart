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
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    spacing: 8,
                    children: [
                      const Icon(Icons.person_search, size: 64),
                      Text(
                        intl.search_title,
                        style: textTheme.displayMedium,
                        textAlign: TextAlign.center,
                      ),
                      const _SearchForm(),
                      Divider(color: colorScheme.primary),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                sliver: SliverToBoxAdapter(
                  child: Text(intl.search_recent_accounts, style: textTheme.titleMedium),
                ),
              ),
              BlocBuilder<RecentAccountsCubit, RecentAccountsState>(
                builder: (context, state) {
                  if (state.status.isLoading) {
                    return const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(child: CircularProgressIndicator.adaptive()),
                    );
                  }

                  if (state.recentAccounts.isEmpty) {
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Column(
                          spacing: 16,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.history,
                              size: 48,
                              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                            ),
                            Text(
                              intl.search_no_recent_accounts,
                              style: textTheme.bodyLarge?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    sliver: SliverList.builder(
                      itemCount: state.recentAccounts.length,
                      itemBuilder: (context, index) {
                        final account = state.recentAccounts.elementAt(index);

                        return ListTile(
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
                        );
                      },
                    ),
                  );
                },
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 32)),
            ],
          ),
        ),
      ),
    );
  }
}
