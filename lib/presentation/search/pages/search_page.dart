import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/domain/entities/entities.dart';
import 'package:summoner_timer/presentation/search/bloc/search_cubit.dart';
import 'package:summoner_timer/presentation/search/bloc/search_state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  final _nameController = TextEditingController();
  final _tagController = TextEditingController();

  late final AnimationController _staggerController;
  late final Animation<double> _iconOpacity;
  late final Animation<double> _iconScale;
  late final Animation<double> _titleOpacity;
  late final Animation<Offset> _titleSlide;
  late final Animation<double> _formOpacity;
  late final Animation<double> _recentOpacity;

  @override
  void initState() {
    super.initState();
    _staggerController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _iconOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _staggerController,
        curve: const Interval(0, 0.2, curve: Curves.easeOut),
      ),
    );

    _iconScale = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(
        parent: _staggerController,
        curve: const Interval(0, 0.2, curve: Curves.elasticOut),
      ),
    );

    _titleOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _staggerController,
        curve: const Interval(0.1, 0.35, curve: Curves.easeOut),
      ),
    );

    _titleSlide = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _staggerController,
        curve: const Interval(0.1, 0.35, curve: Curves.easeOut),
      ),
    );

    _formOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _staggerController,
        curve: const Interval(0.25, 0.6, curve: Curves.easeOut),
      ),
    );

    _recentOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _staggerController,
        curve: const Interval(0.45, 0.8, curve: Curves.easeOut),
      ),
    );

    _staggerController.forward();
  }

  @override
  void dispose() {
    _staggerController.dispose();
    _nameController.dispose();
    _tagController.dispose();
    super.dispose();
  }

  void _onSearch() {
    final name = _nameController.text.trim();
    final tag = _tagController.text.trim();

    if (name.isNotEmpty && tag.isNotEmpty) {
      context.read<SearchCubit>().search(name, tag);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151515),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 48),
                AnimatedBuilder(
                  animation: _staggerController,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _iconOpacity.value,
                      child: Transform.scale(scale: _iconScale.value, child: child),
                    );
                  },
                  child: const Center(
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.redAccent,
                      child: Icon(Icons.search, size: 36, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                AnimatedBuilder(
                  animation: _staggerController,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _titleOpacity.value,
                      child: SlideTransition(position: _titleSlide, child: child),
                    );
                  },
                  child: const Column(
                    children: [
                      Text(
                        'TRACK YOUR LEGEND',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'IDENTIFY SUMMONER VIA RIOT PROTOCOL',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),
                AnimatedBuilder(
                  animation: _staggerController,
                  builder: (context, child) {
                    return Opacity(opacity: _formOpacity.value, child: child);
                  },
                  child: _SearchForm(
                    nameController: _nameController,
                    tagController: _tagController,
                    onSearch: _onSearch,
                  ),
                ),
                const SizedBox(height: 24),
                AnimatedBuilder(
                  animation: _staggerController,
                  builder: (context, child) {
                    return Opacity(opacity: _recentOpacity.value, child: child);
                  },
                  child: const _RecentAccountsSection(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController tagController;
  final VoidCallback onSearch;

  const _SearchForm({
    required this.nameController,
    required this.tagController,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final isLoading =
            state.whenOrNull(loading: () => true, success: (_) => true) ?? false;

        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF222222),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white10),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'RIOT ID',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: nameController,
                enabled: !isLoading,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Summoner Name',
                  hintStyle: const TextStyle(color: Colors.white30),
                  prefixIcon: const Icon(Icons.person, color: Colors.white54),
                  filled: true,
                  fillColor: Colors.black.withValues(alpha: 0.3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'TAGLINE',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: tagController,
                enabled: !isLoading,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'HEX',
                  hintStyle: const TextStyle(color: Colors.white30),
                  prefixIcon: const Icon(Icons.tag, color: Colors.white54),
                  filled: true,
                  fillColor: Colors.black.withValues(alpha: 0.3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: ElevatedButton.icon(
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Icon(Icons.rocket_launch, color: Colors.white),
                    ),
                    label: Text(
                      isLoading ? 'SEARCHING...' : 'INITIATE SEARCH',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isLoading ? Colors.grey[800] : Colors.red[900],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: isLoading ? null : onSearch,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _RecentAccountsSection extends StatelessWidget {
  const _RecentAccountsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'RECENT/SAVED',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white54, fontSize: 12, letterSpacing: 2),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 300,
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (accounts) {
                  if (accounts.isEmpty) {
                    return const Center(
                      child: Text(
                        'No saved accounts',
                        style: TextStyle(color: Colors.white54),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: accounts.length,
                    itemBuilder: (context, index) {
                      final account = accounts[index];
                      return _AnimatedAccountTile(index: index, account: account);
                    },
                  );
                },
                success: (_) => const Center(child: CircularProgressIndicator()),
                error: (message) => Center(
                  child: Text(message, style: const TextStyle(color: Colors.red)),
                ),
                orElse: () {
                  return const Center(child: CircularProgressIndicator());
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _AnimatedAccountTile extends StatefulWidget {
  final int index;
  final Account account;

  const _AnimatedAccountTile({required this.index, required this.account});

  @override
  State<_AnimatedAccountTile> createState() => _AnimatedAccountTileState();
}

class _AnimatedAccountTileState extends State<_AnimatedAccountTile>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    final delay = (widget.index * 0.1).clamp(0.0, 0.5);
    final start = delay;
    final end = (delay + 0.3).clamp(0.0, 1.0);

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(start, end, curve: Curves.easeOut),
          ),
        );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: SlideTransition(position: _slideAnimation, child: child),
        );
      },
      child: _AccountTile(account: widget.account),
    );
  }
}

class _AccountTile extends StatelessWidget {
  final Account account;

  const _AccountTile({required this.account});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF222222),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[800],
          backgroundImage: account.profileIconId != null
              ? NetworkImage(
                  'https://ddragon.leagueoflegends.com/cdn/13.24.1/img/profileicon/${account.profileIconId}.png',
                )
              : null,
          child: account.profileIconId == null
              ? const Icon(Icons.person, color: Colors.white)
              : null,
        ),
        title: Text(
          account.gameName,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '#${account.tagLine}',
          style: const TextStyle(color: Colors.white54),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.white54),
        onTap: () {
          context.read<SearchCubit>().selectSavedAccount(account);
        },
      ),
    );
  }
}
