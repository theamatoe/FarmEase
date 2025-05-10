import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(FarmEaseApp());
}

class FarmEaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmEase',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => AuthChoiceScreen(),
        '/signin': (_) => SignInScreen(),
        '/signup': (_) => SignUpScreen(),
        '/home': (_) => HomeScreen(),
      },
    );
  }
}

// Auth Choice: navigate to Sign In or Sign Up
class AuthChoiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'images/FARMEASE-LOGO-green.png',
                width: 300,
                height: 300,
              ),
              SizedBox(height: 16),
              Text(
                'FarmEase',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32),
              // Changed to Column for vertical buttons
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/signin'),
                    child: Text('Sign In'),
                  ),
                  SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () => Navigator.pushNamed(context, '/signup'),
                    child: Text('Sign Up'),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: <Widget>[
                      Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Sign in with'),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.facebook, color: Colors.blue),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.g_mobiledata, size: 32),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.apple, size: 32),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Sign In Screen
class SignInScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        title: Text('Sign In', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(height: 24),
            Image.asset(
              'images/FARMEASE-LOGO-green.png',
              width: 300,
              height: 300,
            ),
            SizedBox(height: 24),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                    () => Navigator.pushReplacementNamed(context, '/home'),
                child: Text('Sign In'),
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: <Widget>[
                Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Sign in with'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.facebook, color: Colors.blue),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.g_mobiledata, size: 32),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.apple, size: 32)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Sign Up Screen
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  DateTime? _dob;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        title: Text('Sign Up', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  prefix: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('🇵🇭 +63'),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) setState(() => _dob = picked);
                },
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    border: OutlineInputBorder(),
                  ),
                  child: Text(
                    _dob == null ? '' : DateFormat('yyyy-MM-dd').format(_dob!),
                  ),
                ),
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      () => Navigator.pushReplacementNamed(context, '/home'),
                  child: Text('Sign Up'),
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: <Widget>[
                  Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Sign Up with'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.facebook, color: Colors.blue),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.g_mobiledata, size: 32),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.apple, size: 32),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ... HomeScreen and CategoryItem remain unchanged
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onNavTap(int idx) => setState(() => _selectedIndex = idx);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, Juan Dela Cruz',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            SizedBox(height: 4),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.location_on, size: 16, color: Colors.green),
                  Text(' Address here'),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('See All', style: TextStyle(color: Colors.green)),
              ],
            ),
            SizedBox(height: 12),
            Container(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryItem(icon: Icons.grass, label: 'Vegetables'),
                  CategoryItem(
                    icon: Icons.local_grocery_store,
                    label: 'Fruits',
                  ),
                  CategoryItem(icon: Icons.spa, label: 'Herbs'),
                  CategoryItem(icon: Icons.eco, label: 'Organic'),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: 6,
                itemBuilder:
                    (_, idx) => Container(
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.nature),
                          SizedBox(height: 8),
                          Text('Eggplant'),
                          SizedBox(height: 4),
                          Text('₱2.50'),
                        ],
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavTap,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  const CategoryItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: Colors.green[700]),
          SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
