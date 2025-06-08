<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Routing\Controller;
use App\Models\ResendInvoiceRequest;
use App\Models\Invoice;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\Mail;
use App\Mail\InvoicePdfMail;

class ResendInvoiceRequestController extends Controller
{
    public function index()
    {
        $requests = ResendInvoiceRequest::with(['order', 'user'])->latest()->paginate(20);
        return view('admin.resend_invoice_requests.index', compact('requests'));
    }

    public function approve($id)
    {
        $request = ResendInvoiceRequest::findOrFail($id);
        $request->update([
            'status' => 'approved',
            'admin_id' => Auth::id(),
            'approved_at' => now(),
        ]);

        $invoice = Invoice::where('order_id', $request->order_id)->first();
        if ($invoice) {
            $pdf = Pdf::loadView('admin.invoices.pdf', compact('invoice'));
            $pdfContent = $pdf->output();
            Mail::to($request->user->email)->send(new InvoicePdfMail($invoice, $pdfContent));
        }

        return redirect()->route('admin.resend-invoice-requests.index')->with('success', 'Yêu cầu đã được duyệt và hóa đơn đã được gửi.');
    }

    public function reject($id)
    {
        $request = ResendInvoiceRequest::findOrFail($id);
        $request->update([
            'status' => 'rejected',
            'admin_id' => Auth::id(),
        ]);

        return redirect()->route('admin.resend-invoice-requests.index')->with('success', 'Yêu cầu đã bị từ chối.');
    }
} 