part of '../page/search_page.dart';

final class _SearchForm extends StatefulWidget {
  const _SearchForm();

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
    final cubit = context.watch<SearchFormCubit>();

    final colorScheme = ColorScheme.of(context);
    final intl = AppLocalizations.of(context)!;

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
                decoration: InputDecoration(
                  labelText: intl.seach_name_label,
                  hintText: intl.search_name_placeholder,
                  prefixIcon: const Icon(Icons.person),
                  iconColor: colorScheme.primary,
                ),
                onChanged: cubit.updateName,
                validator: (value) =>
                    value?.isEmpty ?? true ? intl.search_name_invalid : null,
              ),

              TextFormField(
                controller: _tagController,
                decoration: InputDecoration(
                  labelText: intl.search_tag_label,
                  prefixIcon: const Icon(Icons.tag),
                  hintText: intl.search_tag_placeholder,
                ),
                onChanged: cubit.updateTag,
                validator: (value) =>
                    value?.isEmpty ?? true ? intl.search_tag_invalid : null,
              ),

              BlocSelector<SearchFormCubit, SearchFormState, bool>(
                selector: (state) => state.status.isLoading,
                builder: (context, isLoadingState) => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: isLoadingState ? null : cubit.searchWithRiotID,
                    label: Text(intl.search_button),
                    icon: isLoadingState
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
