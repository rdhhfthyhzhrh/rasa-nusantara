import 'package:flutter/material.dart';

void main() {
  runApp(const MenuMakananApp());
}

const _orange = Color(0xFFE97836);
const _ink = Color(0xFF252525);
const _muted = Color(0xFF898989);
const _background = Color(0xFFFFFBF7);

class MenuMakananApp extends StatelessWidget {
  const MenuMakananApp({super.key, this.useNetworkImages = true});

  final bool useNetworkImages;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rasa Nusantara',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: _background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _orange,
          primary: _orange,
          surface: _background,
        ),
        fontFamily: 'Roboto',
      ),
      home: MenuHomePage(useNetworkImages: useNetworkImages),
    );
  }
}

class Food {
  const Food({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.rating,
    required this.imageUrl,
  });

  final String id;
  final String name;
  final String category;
  final String description;
  final int price;
  final double rating;
  final String imageUrl;
}

const _foods = <Food>[
  Food(
    id: 'nasi-goreng',
    name: 'Nasi Goreng Spesial',
    category: 'Nusantara',
    description: 'Nasi goreng dengan telur, ayam, dan bumbu rempah pilihan.',
    price: 28000,
    rating: 4.9,
    imageUrl: 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?auto=format&fit=crop&w=900&q=85',
  ),
  Food(
    id: 'sate-ayam',
    name: 'Sate Ayam Madura',
    category: 'Nusantara',
    description: 'Sate ayam bakar dengan bumbu kacang gurih dan lontong.',
    price: 32000,
    rating: 4.8,
    imageUrl: 'https://images.unsplash.com/photo-1529563021893-cc83c992d75d?auto=format&fit=crop&w=900&q=85',
  ),
  Food(
    id: 'mie-ayam',
    name: 'Mie Ayam Bakso',
    category: 'Nusantara',
    description: 'Mie kenyal, ayam berbumbu, dan bakso sapi yang hangat.',
    price: 25000,
    rating: 4.7,
    imageUrl: 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?auto=format&fit=crop&w=900&q=85',
  ),
  Food(
    id: 'ayam-bakar',
    name: 'Ayam Bakar Madu',
    category: 'Nusantara',
    description: 'Ayam bakar madu dengan sambal dan lalapan segar.',
    price: 35000,
    rating: 4.9,
    imageUrl: 'https://images.unsplash.com/photo-1532550907401-a500c9a57435?auto=format&fit=crop&w=900&q=85',
  ),
  Food(
    id: 'ikan-bakar',
    name: 'Ikan Bakar Jimbaran',
    category: 'Seafood',
    description: 'Ikan bakar dengan racikan bumbu khas Jimbaran.',
    price: 48000,
    rating: 4.8,
    imageUrl: 'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?auto=format&fit=crop&w=900&q=85',
  ),
  Food(
    id: 'es-kopi',
    name: 'Es Kopi Susu Gula Aren',
    category: 'Minuman',
    description: 'Kopi susu creamy dengan manis alami gula aren.',
    price: 18000,
    rating: 4.9,
    imageUrl: 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?auto=format&fit=crop&w=900&q=85',
  ),
  Food(
    id: 'pisang-goreng',
    name: 'Pisang Goreng Keju',
    category: 'Camilan',
    description: 'Pisang goreng hangat dengan taburan keju dan cokelat.',
    price: 20000,
    rating: 4.7,
    imageUrl: 'https://images.unsplash.com/photo-1587132137056-bfbf0166836e?auto=format&fit=crop&w=900&q=85',
  ),
  Food(
    id: 'soto-ayam',
    name: 'Soto Ayam Lamongan',
    category: 'Nusantara',
    description: 'Soto ayam kuah kuning lengkap dengan koya gurih.',
    price: 27000,
    rating: 4.8,
    imageUrl: 'https://images.unsplash.com/photo-1547592180-85f173990554?auto=format&fit=crop&w=900&q=85',
  ),
];

class MenuHomePage extends StatefulWidget {
  const MenuHomePage({super.key, this.useNetworkImages = true});

  final bool useNetworkImages;

  @override
  State<MenuHomePage> createState() => _MenuHomePageState();
}

class _MenuHomePageState extends State<MenuHomePage> {
  final _searchController = TextEditingController();
  final Set<String> _favorites = {};
  final Map<String, int> _cart = {};
  String _selectedCategory = 'Semua';
  int _selectedTab = 0;

  static const _categories = [
    'Semua',
    'Nusantara',
    'Seafood',
    'Minuman',
    'Camilan',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Food> _filteredFoods({bool favoritesOnly = false}) {
    final query = _searchController.text.trim().toLowerCase();
    return _foods.where((food) {
      final matchesCategory =
          _selectedCategory == 'Semua' || food.category == _selectedCategory;
      final matchesQuery =
          food.name.toLowerCase().contains(query) ||
          food.category.toLowerCase().contains(query);
      final matchesFavorites = !favoritesOnly || _favorites.contains(food.id);
      return matchesCategory && matchesQuery && matchesFavorites;
    }).toList();
  }

  void _toggleFavorite(Food food) {
    setState(() {
      if (!_favorites.add(food.id)) {
        _favorites.remove(food.id);
      }
    });
  }

  void _addToCart(Food food) {
    setState(() {
      _cart.update(food.id, (quantity) => quantity + 1, ifAbsent: () => 1);
    });
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('${food.name} ditambahkan ke keranjang'),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  int get _cartItemCount =>
      _cart.values.fold(0, (total, quantity) => total + quantity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedTab,
          children: [
            _buildHome(),
            _buildFavorites(),
            _buildCart(),
            _buildProfile(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedTab,
        onDestinationSelected: (index) => setState(() => _selectedTab = index),
        backgroundColor: Colors.white,
        indicatorColor: _orange.withValues(alpha: 0.12),
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Beranda',
          ),
          const NavigationDestination(
            icon: Icon(Icons.favorite_border_rounded),
            selectedIcon: Icon(Icons.favorite_rounded),
            label: 'Favorit',
          ),
          NavigationDestination(
            icon: Badge(
              isLabelVisible: _cartItemCount > 0,
              label: Text('$_cartItemCount'),
              child: const Icon(Icons.shopping_bag_outlined),
            ),
            selectedIcon: Badge(
              isLabelVisible: _cartItemCount > 0,
              label: Text('$_cartItemCount'),
              child: const Icon(Icons.shopping_bag_rounded),
            ),
            label: 'Keranjang',
          ),
          const NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  Widget _buildHome() {
    final foods = _filteredFoods();
    return CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
          sliver: SliverToBoxAdapter(child: _buildGreeting()),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 22, 20, 0),
          sliver: SliverToBoxAdapter(child: _buildSearchField()),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          sliver: SliverToBoxAdapter(child: _buildPromoBanner()),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
          sliver: SliverToBoxAdapter(
            child: _buildSectionHeading('Kategori', 'Lihat semua'),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 14),
          sliver: SliverToBoxAdapter(child: _buildCategories()),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 25, 20, 14),
          sliver: SliverToBoxAdapter(
            child: _buildSectionHeading('Menu favorit', 'Terlaris hari ini'),
          ),
        ),
        _buildFoodGrid(foods),
        const SliverToBoxAdapter(child: SizedBox(height: 22)),
      ],
    );
  }

  Widget _buildGreeting() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Selamat makan 👋',
                style: TextStyle(color: _muted, fontSize: 13),
              ),
              const SizedBox(height: 5),
              Text(
                'Mau makan apa hari ini?',
                style: Theme.of(context).textTheme.titleLarge
                    ?.copyWith(color: _ink, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: const Color(0xFFFFE9D8),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(Icons.restaurant_rounded, color: _orange),
        ),
      ],
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      onChanged: (_) => setState(() {}),
      decoration: InputDecoration(
        hintText: 'Cari makanan favoritmu...',
        hintStyle: const TextStyle(color: _muted, fontSize: 14),
        prefixIcon: const Icon(Icons.search_rounded, color: _orange),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFF0ECE8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: _orange),
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      height: 156,
      decoration: BoxDecoration(
        color: const Color(0xFF35251C),
        borderRadius: BorderRadius.circular(22),
        image: widget.useNetworkImages
            ? const DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1547592180-85f173990554?auto=format&fit=crop&w=1200&q=85',
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Color(0x99000000),
                  BlendMode.darken,
                ),
              )
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: _orange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'PROMO HARI INI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.7,
                ),
              ),
            ),
            const SizedBox(height: 9),
            const Text(
              'Diskon 20% untuk\nmenu pilihan!',
              style: TextStyle(
                color: Colors.white,
                height: 1.2,
                fontSize: 21,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Nikmati lezatnya hari ini',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeading(String title, String trailing) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: _ink,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          trailing,
          style: const TextStyle(
            color: _orange,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 42,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 9),
        itemBuilder: (context, index) {
          final category = _categories[index];
          final selected = category == _selectedCategory;
          return ChoiceChip(
            label: Text(category),
            selected: selected,
            onSelected: (_) => setState(() => _selectedCategory = category),
            showCheckmark: false,
            labelStyle: TextStyle(
              color: selected ? Colors.white : _muted,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            selectedColor: _orange,
            backgroundColor: Colors.white,
            side: BorderSide(
              color: selected ? _orange : const Color(0xFFF0ECE8),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
          );
        },
      ),
    );
  }

  Widget _buildFoodGrid(List<Food> foods) {
    if (foods.isEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 48),
          child: _buildEmptyState(
            icon: Icons.search_off_rounded,
            title: 'Menu tidak ditemukan',
            message: 'Coba kata kunci atau kategori yang berbeda.',
          ),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 240,
          mainAxisExtent: 244,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          final food = foods[index];
          return FoodCard(
            food: food,
            isFavorite: _favorites.contains(food.id),
            useNetworkImages: widget.useNetworkImages,
            onFavorite: () => _toggleFavorite(food),
            onTap: () => _showFoodDetails(food),
          );
        }, childCount: foods.length),
      ),
    );
  }

  Widget _buildFavorites() {
    final foods = _filteredFoods(favoritesOnly: true);
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 22, 20, 18),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Menu Favorit',
              style: Theme.of(context).textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w800, color: _ink),
            ),
          ),
        ),
        if (_favorites.isEmpty)
          SliverFillRemaining(
            hasScrollBody: false,
            child: _buildEmptyState(
              icon: Icons.favorite_border_rounded,
              title: 'Belum ada menu favorit',
              message: 'Tekan ikon hati pada menu untuk menyimpannya di sini.',
            ),
          )
        else
          _buildFoodGrid(foods),
      ],
    );
  }

  Widget _buildCart() {
    final cartFoods = _foods
        .where((food) => _cart.containsKey(food.id))
        .toList();
    final total = cartFoods.fold<int>(
      0,
      (sum, food) => sum + food.price * _cart[food.id]!,
    );

    if (cartFoods.isEmpty) {
      return _buildEmptyState(
        icon: Icons.shopping_bag_outlined,
        title: 'Keranjang masih kosong',
        message: 'Yuk pilih menu lezat untuk menemani harimu.',
        action: FilledButton(
          onPressed: () => setState(() => _selectedTab = 0),
          style: FilledButton.styleFrom(backgroundColor: _orange),
          child: const Text('Jelajahi menu'),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 22, 20, 18),
          child: Text(
            'Keranjang',
            style: Theme.of(context).textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w800, color: _ink),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: cartFoods.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final food = cartFoods[index];
              return _buildCartItem(food);
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
          ),
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total pembayaran',
                      style: TextStyle(color: _muted),
                    ),
                    Text(
                      _formatPrice(total),
                      style: const TextStyle(
                        color: _ink,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () => _showCheckoutMessage(),
                    style: FilledButton.styleFrom(
                      backgroundColor: _orange,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text('Pesan sekarang'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCartItem(Food food) {
    final quantity = _cart[food.id]!;
    return Container(
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 72,
              height: 72,
              child: _foodImage(
                food.imageUrl,
                iconSize: 25,
                useNetworkImages: widget.useNetworkImages,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.name,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 5),
                Text(
                  _formatPrice(food.price),
                  style: const TextStyle(color: _orange),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => setState(() {
              if (quantity == 1) {
                _cart.remove(food.id);
              } else {
                _cart[food.id] = quantity - 1;
              }
            }),
            icon: const Icon(Icons.remove_circle_outline_rounded),
            color: _muted,
            visualDensity: VisualDensity.compact,
          ),
          Text(
            '$quantity',
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          IconButton(
            onPressed: () => _addToCart(food),
            icon: const Icon(Icons.add_circle_rounded),
            color: _orange,
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }

  Widget _buildProfile() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 20),
      children: [
        Text(
          'Profil Saya',
          style: Theme.of(context).textTheme.headlineSmall
              ?.copyWith(fontWeight: FontWeight.w800, color: _ink),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Color(0xFFFFE9D8),
                child: Icon(Icons.person_rounded, color: _orange, size: 30),
              ),
              SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pelanggan Rasa',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Selamat datang!',
                    style: TextStyle(color: _muted, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        _profileOption(Icons.location_on_outlined, 'Alamat pengantaran'),
        _profileOption(Icons.receipt_long_outlined, 'Riwayat pesanan'),
        _profileOption(Icons.help_outline_rounded, 'Bantuan'),
        _profileOption(Icons.settings_outlined, 'Pengaturan'),
      ],
    );
  }

  Widget _profileOption(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        child: ListTile(
          leading: Icon(icon, color: _orange),
          title: Text(title, style: const TextStyle(fontSize: 14)),
          trailing: const Icon(Icons.chevron_right_rounded, color: _muted),
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$title akan segera tersedia')),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState({
    required IconData icon,
    required String title,
    required String message,
    Widget? action,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 82,
              height: 82,
              decoration: const BoxDecoration(
                color: Color(0xFFFFE9D8),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: _orange, size: 38),
            ),
            const SizedBox(height: 18),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: _ink,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: _muted, height: 1.4),
            ),
            if (action != null) ...[const SizedBox(height: 18), action],
          ],
        ),
      ),
    );
  }

  Future<void> _showFoodDetails(Food food) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: _background,
          borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 42,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDED8D2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: 210,
                    width: double.infinity,
                    child: _foodImage(
                      food.imageUrl,
                      iconSize: 48,
                      useNetworkImages: widget.useNetworkImages,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        food.name,
                        style: const TextStyle(
                          color: _ink,
                          fontSize: 21,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.star_rounded,
                      color: Color(0xFFFFB547),
                      size: 19,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${food.rating}',
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  food.description,
                  style: const TextStyle(color: _muted, height: 1.5),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        _formatPrice(food.price),
                        style: const TextStyle(
                          color: _orange,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    FilledButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        _addToCart(food);
                      },
                      icon: const Icon(Icons.add_shopping_cart_rounded),
                      label: const Text('Tambah'),
                      style: FilledButton.styleFrom(
                        backgroundColor: _orange,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCheckoutMessage() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Text('Pesananmu siap diproses. Terima kasih!'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    setState(() {
      _cart.clear();
    });
  }
}

class FoodCard extends StatelessWidget {
  const FoodCard({
    required this.food,
    required this.isFavorite,
    required this.useNetworkImages,
    required this.onFavorite,
    required this.onTap,
    super.key,
  });

  final Food food;
  final bool isFavorite;
  final bool useNetworkImages;
  final VoidCallback onFavorite;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 132,
                  width: double.infinity,
                  child: _foodImage(
                    food.imageUrl,
                    iconSize: 34,
                    useNetworkImages: useNetworkImages,
                  ),
                ),
                Positioned(
                  top: 9,
                  right: 9,
                  child: Material(
                    color: Colors.white.withValues(alpha: 0.95),
                    shape: const CircleBorder(),
                    child: InkWell(
                      onTap: onFavorite,
                      customBorder: const CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(7),
                        child: Icon(
                          isFavorite
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: isFavorite ? _orange : _ink,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 9,
                  bottom: 9,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.94),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Color(0xFFFFB547),
                          size: 14,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '${food.rating}',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(11, 9, 11, 9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: _ink,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      food.category,
                      style: const TextStyle(color: _muted, fontSize: 11),
                    ),
                    const Spacer(),
                    Text(
                      _formatPrice(food.price),
                      style: const TextStyle(
                        color: _orange,
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _foodImage(
  String imageUrl, {
  required double iconSize,
  required bool useNetworkImages,
}) {
  if (!useNetworkImages) {
    return Container(
      color: const Color(0xFFFFE9D8),
      alignment: Alignment.center,
      child: Icon(Icons.restaurant_rounded, color: _orange, size: iconSize),
    );
  }
  return Image.network(
    imageUrl,
    fit: BoxFit.cover,
    errorBuilder: (context, error, stackTrace) => Container(
      color: const Color(0xFFFFE9D8),
      alignment: Alignment.center,
      child: Icon(Icons.restaurant_rounded, color: _orange, size: iconSize),
    ),
  );
}

String _formatPrice(int price) {
  final digits = price.toString();
  final formatted = StringBuffer();
  for (var index = 0; index < digits.length; index++) {
    if (index > 0 && (digits.length - index) % 3 == 0) {
      formatted.write('.');
    }
    formatted.write(digits[index]);
  }
  return 'Rp$formatted';
}
