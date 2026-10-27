import 'package:flutter_test/flutter_test.dart';
import 'package:menu_makanan/main.dart';

void main() {
  testWidgets('Menu makanan tampil dengan navigasi utama', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MenuMakananApp(useNetworkImages: false));

    expect(find.text('Mau makan apa hari ini?'), findsOneWidget);
    expect(find.text('Beranda'), findsOneWidget);
    expect(find.text('Favorit'), findsOneWidget);
    expect(find.text('Keranjang'), findsOneWidget);
    expect(find.text('Profil'), findsOneWidget);

    await tester.tap(find.text('Profil'));
    await tester.pump();
    expect(find.text('Profil Saya'), findsOneWidget);

    await tester.tap(find.text('Favorit'));
    await tester.pump();
    expect(find.text('Menu Favorit'), findsOneWidget);
    expect(find.text('Belum ada menu favorit'), findsOneWidget);
  });
}
