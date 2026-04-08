part of 'search_page.dart';

final class _SearchView extends StatefulWidget {
  const _SearchView();

  @override
  State<_SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<_SearchView> with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(parent: _fadeController, curve: Curves.easeOut);
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final intl = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
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

                              return _AnimatedListItem(
                                index: index,
                                child: Card(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  child: ListTile(
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
                                  ),
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
      ),
    );
  }
}

final class _AnimatedListItem extends StatefulWidget {
  const _AnimatedListItem({required this.index, required this.child});

  final int index;
  final Widget child;

  @override
  State<_AnimatedListItem> createState() => _AnimatedListItemState();
}

class _AnimatedListItemState extends State<_AnimatedListItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    final delay = (widget.index * 0.1).clamp(0.0, 0.6);
    final start = delay;
    final end = delay + 0.4;

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0.0, 0.3), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(start, end, curve: Curves.easeOutCubic),
          ),
        );

    Future.delayed(Duration(milliseconds: (widget.index * 50).clamp(0, 300)), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(position: _slideAnimation, child: widget.child),
    );
  }
}
