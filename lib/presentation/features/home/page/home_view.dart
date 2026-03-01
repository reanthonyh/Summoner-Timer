part of 'home_page.dart';

final class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.currentTab.index,
            children: const [SearchPage(), ManualToolPage()],
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: state.currentTab.index,
            onDestinationSelected: (index) {
              context.read<HomeCubit>().setTab(HomeTab.values[index]);
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.search),
                selectedIcon: Icon(Icons.search),
                label: 'Search',
              ),
              NavigationDestination(
                icon: Icon(Icons.timer_outlined),
                selectedIcon: Icon(Icons.timer),
                label: 'Manual Tool',
              ),
            ],
          ),
        );
      },
    );
  }
}
