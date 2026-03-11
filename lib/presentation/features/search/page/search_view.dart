part of 'search_page.dart';

final class _SearchView extends StatefulWidget {
  @override
  State<_SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<_SearchView> {
  final _nameController = TextEditingController();
  final _tagController = TextEditingController();
  final _nameFocusNode = FocusNode();
  final _tagFocusNode = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _tagController.dispose();
    _nameFocusNode.dispose();
    _tagFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<SearchCubit, SearchState>(
          builder: (context, state) {
            final cubit = context.read<SearchCubit>();

            if (state.status == .loading && state.account == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      spacing: 4,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(Icons.search, size: 64, color: colorScheme.primary),
                        Text(
                          'Search Your Summoner',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Enter your Riot ID to find your profile',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        TextField(
                          controller: _nameController,
                          focusNode: _nameFocusNode,
                          decoration: InputDecoration(
                            labelText: 'Game Name',
                            hintText: 'Enter your game name',
                            prefixIcon: const Icon(Icons.person_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                          ),
                          textInputAction: TextInputAction.next,
                          onChanged: cubit.onChangeName,
                          onSubmitted: (_) {
                            _tagFocusNode.requestFocus();
                          },
                        ),
                        TextField(
                          controller: _tagController,
                          focusNode: _tagFocusNode,
                          decoration: InputDecoration(
                            labelText: 'Tag Line',
                            hintText: 'e.g., NA1',
                            prefixIcon: const Icon(Icons.tag),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                          ),
                          textInputAction: TextInputAction.search,
                          onChanged: cubit.onChangeTag,
                          onSubmitted: state.isValid ? (_) => cubit.submit() : null,
                        ),
                        const SizedBox(height: 24),
                        FilledButton.icon(
                          onPressed: state.isValid && state.status != .loading
                              ? () {
                                  _nameFocusNode.unfocus();
                                  _tagFocusNode.unfocus();
                                  cubit.submit();
                                }
                              : null,
                          icon: state.status == .loading
                              ? SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: colorScheme.onPrimary,
                                  ),
                                )
                              : const Icon(Icons.search),
                          label: Text(
                            state.status == .loading ? 'Searching...' : 'Search Summoner',
                          ),
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (state.savedAccounts != null && state.savedAccounts!.isNotEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Recent Searches',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Clear All'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                if (state.savedAccounts != null && state.savedAccounts!.isNotEmpty)
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final account = state.savedAccounts![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: colorScheme.outlineVariant),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: colorScheme.primaryContainer,
                              child: Text(
                                account.gameName[0].toUpperCase(),
                                style: TextStyle(
                                  color: colorScheme.onPrimaryContainer,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            title: Text(
                              account.gameName,
                              style: const TextStyle(fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text('#${account.tagLine}'),
                            trailing: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.secondaryContainer,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                account.region.code,
                                style: TextStyle(
                                  color: colorScheme.onSecondaryContainer,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            onTap: () {
                              _nameController.text = account.gameName;
                              _tagController.text = account.tagLine;
                              cubit.selectAccount(account);
                            },
                          ),
                        ),
                      );
                    }, childCount: state.savedAccounts!.length),
                  ),
                if (state.savedAccounts == null || state.savedAccounts!.isEmpty)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.history,
                            size: 48,
                            color: colorScheme.outlineVariant,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No recent searches',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                const SliverToBoxAdapter(child: SizedBox(height: 24)),
              ],
            );
          },
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status == UiStatus.success && state.account != null) {
              Navigator.of(context).push(ProfilePage.route());
            }

            if (state.status == UiStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Error fetching the Summoner'),
                  backgroundColor: Theme.of(context).colorScheme.error,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
