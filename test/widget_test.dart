import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nav1/main.dart';

void main() {
  testWidgets('App launches with blank fields, logs in, and browses Filipino artists',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Verify Login Screen brand elements and blank fields
    expect(find.text('Philippine Cinema Portal'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);

    // Enter email and password
    await tester.enterText(
        find.widgetWithText(TextFormField, 'Enter your email address'),
        'marian.rivera@cinema.ph');
    await tester.enterText(
        find.widgetWithText(TextFormField, 'Enter your password'),
        'MarianPassword2026!');
    await tester.pumpAndSettle();

    // Ensure Sign In button is scrolled into view and tap it
    await tester.ensureVisible(find.text('Sign In'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Sign In'));
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pumpAndSettle();

    // Verify Main Navigation Screen and Dashboard are displayed
    expect(find.text('Cinema Dashboard'), findsOneWidget);
    expect(find.text('Welcome back, Marian Rivera'), findsOneWidget);
    expect(find.text('Archived Artists'), findsOneWidget);

    // Tap Contacts tab in bottom navigation bar
    await tester.tap(find.byIcon(Icons.people_outline_rounded));
    await tester.pumpAndSettle();
    expect(find.text('Contacts'), findsOneWidget);

    // Verify Filipino screen icons are listed (Marian Rivera, Aga Muhlach, etc.)
    expect(find.text('Marian Rivera'), findsOneWidget);
    expect(find.text('Aga Muhlach'), findsOneWidget);

    // Tap Aga Muhlach to test redirection to detail screen
    await tester.tap(find.text('Aga Muhlach'));
    await tester.pumpAndSettle();

    // Verify Artist Detail screen
    expect(find.text('Artist Profile'), findsOneWidget);
    expect(find.text('Aga Muhlach'), findsOneWidget);
    expect(find.text('Call'), findsOneWidget);
    expect(find.text('Text'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Biography & Film Legacy'), findsOneWidget);
    expect(find.text('Iconic Roles & Achievements'), findsOneWidget);

    // Tap Back button
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new_rounded));
    await tester.pumpAndSettle();

    // Returned to Contacts list
    expect(find.text('Aga Muhlach'), findsOneWidget);
  });
}
