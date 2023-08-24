<?php

namespace App\Http\Controllers;

use App\Models\About;
use App\Models\TemporaryCart;
use App\Models\Cart;
use App\Models\Category;
use App\Models\Order;
use App\Models\Payment;
use App\Models\Product;
use App\Models\Slider;
use App\Models\Testimoni;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

class HomeController extends Controller
{
    public function index()
    {
        $sliders = Slider::all();
        $categories = Category::all();
        $testimonies = Testimoni::all();
        $products = Product::skip(0)->take(8)->get();
        return view('home.index', compact('sliders', 'categories', 'testimonies', 'products'));
    }

    public function products($id_subcategory)
    {
        $products = Product::where('id_subkategori', $id_subcategory)->get();
        return view('home.products', compact('products'));
    }

    public function produk()
    {
        $query = Product::query();  // Inisiasi query

        if (request('search')) {
            $query->where('nama_barang', 'like', '%' . request('search') . '%');
        }

        $produk = $query->latest()->get();

        return view('home.produk', compact('produk'));
    }

    public function delete_from_cart(Cart $cart)
    {
        $cart->delete();
        return redirect('/cart');
    }

    public function add_to_cart(Request $request)
    {
        $input = $request->all();
        Cart::create($input);
    }

    public function product($id_product)
    {
        $product = Product::find($id_product);
        $latest_products = Product::orderByDesc('created_at')->offset(0)->limit(10)->get();

        return view('home.product', compact('product', 'latest_products'));
    }

    public function cart()
    {
        if (!Auth::guard('webmember')->user()) {
            return redirect('/login_member');
        }

        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://api.rajaongkir.com/starter/province",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_HTTPHEADER => array(
                "key: e4381cb2a68ff0fc4d178a1671412de8"
            ),
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
            echo "cURL Error #:" . $err;
        }

        $provinsi = json_decode($response);
        $carts = Cart::where('id_member', Auth::guard('webmember')->user()->id)->get();
        $cart_total = Cart::where('id_member', Auth::guard('webmember')->user()->id)->sum('total');
        return view('home.cart', compact('carts', 'provinsi', 'cart_total'));
    }

    public function get_kota($id)
    {
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://api.rajaongkir.com/starter/city?province=" . $id,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_HTTPHEADER => array(
                "key: e4381cb2a68ff0fc4d178a1671412de8"
            ),
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
            echo "cURL Error #:" . $err;
        } else {
            echo $response;
        }
    }

    public function get_ongkir($destination, $weight)
    {
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://api.rajaongkir.com/starter/cost",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "POST",
            CURLOPT_POSTFIELDS => "origin=456&destination=" . $destination . "&weight=" . $weight . "&courier=jne",
            CURLOPT_HTTPHEADER => array(
                "content-type: application/x-www-form-urlencoded",
                "key: e4381cb2a68ff0fc4d178a1671412de8"
            ),
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
            echo "cURL Error #:" . $err;
        } else {
            echo $response;
        }
    }

    public function checkout_orders(Request $request)
    {
        // Konfigurasi Midtrans
        \Midtrans\Config::$serverKey = env('MIDTRANS_SERVER_KEY');
        \Midtrans\Config::$isProduction = false; // Ganti ke 'true' saat sudah siap ke production

        $idMember = Auth::guard('webmember')->user()->id;

        // Mengambil data dari carts
        $currentCarts = Cart::where('id_member', $idMember)->get();

        // Menghitung total dari tabel carts
        $cartTotal = $currentCarts->sum('total');

        // Mengekstrak ongkir dari request dan mengkonversi ke integer
        $ongkir = intval($request->ongkir);

        $grandTotalWithOngkir = $cartTotal + $ongkir;

        // Salin data dari carts ke temporary_carts
        foreach ($currentCarts as $cart) {
            DB::table('temporary_carts')->insert([
                'id_member' => $cart->id_member,
                'id_barang' => $cart->id_barang,
                'jumlah' => $cart->jumlah,
                'size' => $cart->size,
                'color' => $cart->color,
                'total' => $cart->total,
                'is_checkout' => 0
            ]);
        }

        // Hapus data dari carts setelah dipastikan telah disimpan di temporary_carts
        Cart::where('id_member', $idMember)->delete();

        // Memasukkan ke tabel orders
        $id = DB::table('orders')->insertGetId([
            'id_member' => $request->id_member,
            'invoice' => date('ymds'),
            'grand_total' => $grandTotalWithOngkir,
            'status' => 'Dikemas',
            'created_at' => date('Y-m-d H:i:s')
        ]);

        for ($i = 0; $i < count($request->id_produk); $i++) {
            DB::table('order_details')->insert([
                'id_order' => $id,
                'id_produk' => $request->id_produk[$i],
                'jumlah' => $request->jumlah[$i],
                'size' => $request->size[$i],
                'color' => $request->color[$i],
                'total' => $request->total[$i],
                'created_at' => date('Y-m-d H:i:s')
            ]);
        }

        // Simpan detail alamat ke tabel payment
        Payment::create([
            'id_order' => $id,
            'id_member' => $idMember,
            'jumlah' => $grandTotalWithOngkir,
            'provinsi' => $request->alamat_provinsi,
            'kabupaten' => $request->alamat_kabupaten,
            'detail_alamat' => $request->detail_alamat,
            'status' => 'Diterima',
            'no_rekening' => '0',
            'atas_nama' => $request->atas_nama,
        ]);

        // Pembuatan transaksi di Midtrans
        $transaction_details = array(
            'order_id' => 'order-id-' . $id,
            'gross_amount' =>  $grandTotalWithOngkir
        );

        $callbacks = array(
            'finish' => 'http://127.0.0.1:8000/orders'
        );

        $items = [];
        for ($i = 0; $i < count($request->id_produk); $i++) {
            $productId = $request->id_produk[$i];
            $product = Product::find($productId);
            $productName = $product ? $product->nama_barang : "Nama Produk Tidak Ditemukan";

            // Ambil harga satuan dari produk, bukan total
            $pricePerItem = $request->total[$i] / $request->jumlah[$i];

            $items[] = [
                'id' => $productId,
                'price' => $pricePerItem, // Kirim harga per unit barang
                'quantity' => $request->jumlah[$i],
                'name' => $productName
            ];
        }

        // Menambahkan ongkir sebagai item tambahan
        $items[] = [
            'id' => 'ongkir',
            'price' => $ongkir,
            'quantity' => 1,
            'name' => 'Ongkos Kirim'
        ];

        $transaction = [
            'transaction_details' => $transaction_details,
            'item_details' => $items,
            'callbacks' => $callbacks
        ];

        $snapToken = \Midtrans\Snap::getSnapToken($transaction);

        return response()->json(['snapToken' => $snapToken]);
    }


    public function handleMidtransCallback(Request $request)
    {
        // Log data dari Midtrans
        Log::info("Received callback from Midtrans: ", $request->all());

        // Verifikasi data dari Midtrans
        $status = $request->transaction_status;

        $idMember = Auth::guard('webmember')->user()->id;

        if ($status == "settlement" || $status == "capture") {
            // Pembayaran berhasil

            // Cek jumlah data di temporary_carts sebelum penghapusan
            $tempCartsCount = DB::table('temporary_carts')->where('id_member', $idMember)->count();
            Log::info("Number of temporary carts for id_member $idMember before delete: $tempCartsCount");

            // Hapus data dari temporary_carts
            DB::transaction(function () use ($idMember) {
                DB::table('temporary_carts')->where('id_member', $idMember)->delete();
            });

            // Cek jumlah data di temporary_carts setelah penghapusan
            $tempCartsCountAfterDelete = DB::table('temporary_carts')->where('id_member', $idMember)->count();
            Log::info("Number of temporary carts for id_member $idMember after delete: $tempCartsCountAfterDelete");
        } else if ($status == "cancel" || $status == "deny" || $status == "expire") {
            // Pembayaran gagal atau dibatalkan

            // Kembalikan data dari temporary_carts ke carts
            $tempCarts = DB::table('temporary_carts')->where('id_member', $idMember)->get();

            foreach ($tempCarts as $cart) {
                Cart::create([
                    'id_member' => $cart->id_member,
                    'id_barang' => $cart->id_barang,
                    'jumlah' => $cart->jumlah,
                    'size' => $cart->size,
                    'color' => $cart->color,
                    'total' => $cart->total,
                    'is_checkout' => 0
                ]);
            }

            // Hapus data dari temporary_carts setelah dipastikan telah dikembalikan ke carts
            DB::transaction(function () use ($idMember) {
                DB::table('temporary_carts')->where('id_member', $idMember)->delete();
            });
        }

        return response()->json(['message' => 'Callback handled']);
    }

    public function restoreCarts(Request $request)
    {
        // Ambil data dari temporary_carts berdasarkan id_member yang sedang login
        $temporaryCarts = TemporaryCart::where('id_member', Auth::guard('webmember')->user()->id)->get();

        foreach ($temporaryCarts as $tempCart) {
            // Masukkan data ke carts
            Cart::create([
                'id_member' => $tempCart->id_member,
                'id_barang' => $tempCart->id_barang,
                'jumlah' => $tempCart->jumlah,
                'size' => $tempCart->size,
                'color' => $tempCart->color,
                'total' => $tempCart->total,
                'is_checkout' => 0, // Anda mungkin ingin mengatur ini ke 0 atau mengikuti settingan Anda yang lain
            ]);

            // Setelah dipindahkan, hapus data dari temporary_carts
            $tempCart->delete();
        }

        return response()->json(['message' => 'Cart restored successfully']);
    }

    public function checkout()
    {
        $about = About::first();

        // Mengambil order dengan status "baru" dan id_member sesuai dengan user yang login
        $orders = Order::where('id_member', Auth::guard('webmember')->user()->id)
            ->where('status', 'baru')
            ->first();

        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://api.rajaongkir.com/starter/province",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_HTTPHEADER => array(
                "key: e4381cb2a68ff0fc4d178a1671412de8"
            ),
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
            echo "cURL Error #:" . $err;
        }

        $provinsi = json_decode($response);
        return view('home.checkout', compact('about', 'orders', 'provinsi'));
    }

    public function payments(Request $request)
    {
        Payment::create([
            'id_order' => $request->id_order,
            'id_member' => Auth::guard('webmember')->user()->id,
            'jumlah' => $request->jumlah,
            'provinsi' => $request->provinsi,
            'kabupaten' => $request->kabupaten,
            'detail_alamat' => $request->detail_alamat,
            'status' => 'Menunggu Pembayaran',
            'no_rekening' => $request->no_rekening,
            'atas_nama' => $request->atas_nama,
        ]);
        return redirect('/orders');
    }

    public function orders()
    {
        $orders = Order::where('id_member', Auth::guard('webmember')->user()->id)->get();
        $payments = Payment::where('id_member', Auth::guard('webmember')->user()->id)->get();
        return view('home.orders', compact('orders', 'payments'));
    }

    public function pesanan_selesai(Order $order)
    {
        $order->status = 'Selesai';
        $order->save();

        return redirect('/orders');
    }

    public function about()
    {
        $about = About::first();
        $testimonies = Testimoni::all();
        return view('home.about', compact('about', 'testimonies'));
    }

    public function contact()
    {
        $about = About::first();
        return view('home.contact', compact('about'));
    }

    public function faq()
    {
        return view('home.faq');
    }
}
