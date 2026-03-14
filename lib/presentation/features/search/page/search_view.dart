part of 'search_page.dart';

final class _SearchView extends StatelessWidget {
  const _SearchView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<SearchCubit, SearchState>(
          listener: (context, state) {
            if (state.status == .error) {
              ScaffoldMessenger.of(context)
                ..clearSnackBars()
                ..showSnackBar(
                  SnackBar(content: Text(state.message ?? "An Errror happend")),
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
                const Text(
                  'Search your RiotID',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Divider(),
                _SearchForm(),
                const Divider(),
                Expanded(
                  child: BlocSelector<SearchCubit, SearchState, List<Account>>(
                    selector: (state) => state.recentAccounts,
                    builder: (context, state) {
                      return Column(
                        spacing: 4,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              'Recent Accounts',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.length,
                              itemBuilder: (context, index) {
                                final account = state[index];
                                return ListTile(
                                  leading: CircleAvatar(
                                    child: CachedNetworkImage(imageUrl: account.iconUrl),
                                  ),
                                  title: Text('${account.gameName}#${account.tagLine}'),
                                  subtitle: Text(account.region.name.toUpperCase()),
                                  onTap: () {
                                    debugPrint('Navigating to Profile with $account');

                                    context.read<SearchCubit>().searchWithPUUID(
                                      account.puuid,
                                    );
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

class _SearchForm extends StatefulWidget {
  @override
  State<_SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<_SearchForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameController;
  late final TextEditingController _tagController;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();

    _nameController = TextEditingController();
    _tagController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SearchCubit>();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 12,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Game Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                onChanged: cubit.updateName,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Name should not be empty' : null,
              ),

              TextFormField(
                controller: _tagController,
                decoration: const InputDecoration(
                  labelText: 'Tag Line',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.tag),
                  hintText: 'e.g., NA',
                ),
                onChanged: cubit.updateTag,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Tag should not be empty' : null,
              ),

              BlocSelector<SearchCubit, SearchState, bool>(
                selector: (state) => state.status.isLoading,
                builder: (context, state) => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: state ? null : cubit.searchWithRiotID,
                    label: const Text('Search'),
                    icon: state
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator.adaptive(),
                          )
                        : const Icon(Icons.search),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
