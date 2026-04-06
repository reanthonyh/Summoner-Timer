part of 'profile_page.dart';

final class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final intl = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(intl.profile_title), centerTitle: true),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: _handleListener,
        builder: (context, state) {
          if (state.status.isLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          final account = state.account;

          if (account == null) {
            return const Center(child: Text('No Account Selected'));
          }

          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: AppSpacing.lg,
                sliver: SliverToBoxAdapter(
                  child: Column(
                    spacing: 16,
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: account.iconUrl.isNotEmpty
                            ? CachedNetworkImageProvider(account.iconUrl)
                            : null,
                        child: account.iconUrl.isEmpty
                            ? const Icon(Icons.person, size: 64)
                            : null,
                      ),

                      Text(
                        account.riotID,
                        style: textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      Row(
                        spacing: 16,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: AppSpacing.sm,
                            decoration: BoxDecoration(
                              color: colorScheme.secondaryContainer,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(account.region.name.toUpperCase()),
                          ),
                          Text(intl.profile_level(account.level)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: AppSpacing.md,
                sliver: SliverToBoxAdapter(
                  child: Card(
                    elevation: 2,
                    color: colorScheme.surfaceContainerLow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: colorScheme.outlineVariant),
                    ),
                    child: Padding(
                      padding: AppSpacing.lg,
                      child: FilledButton.icon(
                        onPressed: () {
                          Navigator.of(context).pushNamed(GamePage.routeName);
                        },
                        icon: const Icon(Icons.play_arrow),
                        label: Text(intl.profile_search_game),
                      ),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: AppSpacing.md,
                sliver: SliverToBoxAdapter(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      context.read<ProfileCubit>().logout();
                      Navigator.of(
                        context,
                      ).pushNamedAndRemoveUntil(SearchPage.routeName, (_) => false);
                    },
                    icon: const Icon(Icons.switch_account),
                    label: Text(intl.profile_change_account),
                    style: OutlinedButton.styleFrom(
                      padding: AppSpacing.sm,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
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
              content: Text(state.message ?? AppLocalizations.of(context)!.general_error),
              duration: Durations.extralong2,
            ),
          );
      default:
        break;
    }
  }
}
