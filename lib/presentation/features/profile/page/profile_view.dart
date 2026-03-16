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
                        radius: 64,
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
                            padding: AppSpacing.md,
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
                padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
                sliver: SliverToBoxAdapter(
                  child: Card(
                    elevation: 0,
                    color: colorScheme.surfaceContainerLow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                      side: BorderSide(color: colorScheme.outlineVariant),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        spacing: 24,
                        children: [
                          Column(
                            spacing: 8,
                            children: [
                              Icon(
                                Icons.videogame_asset,
                                size: 48,
                                color: colorScheme.primary,
                              ),
                              Text(
                                intl.profile_not_in_game,
                                style: textTheme.titleMedium,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 64,
                            child: FilledButton.icon(
                              onPressed: () {
                                // TODO: Add navigation to GamePage or search game logic
                              },
                              icon: const Icon(Icons.play_arrow),
                              label: Text(
                                intl.profile_search_game,
                                style: const TextStyle(fontSize: 18),
                              ),
                              style: FilledButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverToBoxAdapter(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      context.read<ProfileCubit>().logout();
                      Navigator.of(
                        context,
                      ).pushNamedAndRemoveUntil('search', (_) => false);
                    },
                    icon: const Icon(Icons.switch_account),
                    label: Text(intl.profile_change_account),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
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
              content: Text(state.message ?? "An error happend"),
              duration: Durations.extralong2,
            ),
          );
      default:
        break;
    }
  }
}
