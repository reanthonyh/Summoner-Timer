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
    final cubit = context.read<SearchFormCubit>();

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final intl = AppLocalizations.of(context)!;

    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: intl.seach_name_label,
                  hintText: intl.search_name_placeholder,
                  prefixIcon: const Icon(Icons.person),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                textInputAction: TextInputAction.next,
                validator: (value) =>
                    value?.isEmpty ?? true ? intl.search_name_invalid : null,
              ),

              TextFormField(
                controller: _tagController,
                decoration: InputDecoration(
                  labelText: intl.search_tag_label,
                  hintText: intl.search_tag_placeholder,
                  prefixIcon: const Icon(Icons.tag),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                textInputAction: TextInputAction.search,
                onFieldSubmitted: (_) {
                  if (_formKey.currentState?.validate() ?? false) {
                    cubit.searchWithRiotID(
                      name: _nameController.text,
                      tag: _tagController.text,
                    );
                  }
                },
                validator: (value) =>
                    value?.isEmpty ?? true ? intl.search_tag_invalid : null,
              ),

              const SizedBox(height: 8),

              BlocSelector<SearchFormCubit, SearchFormState, bool>(
                selector: (state) => state.status.isLoading,
                builder: (context, isLoadingState) => SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: FilledButton.icon(
                    onPressed: isLoadingState
                        ? null
                        : () {
                            if (_formKey.currentState?.validate() ?? false) {
                              cubit.searchWithRiotID(
                                name: _nameController.text,
                                tag: _tagController.text,
                              );
                            }
                          },
                    label: Text(intl.search_button),
                    icon: isLoadingState
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator.adaptive(strokeWidth: 2),
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
