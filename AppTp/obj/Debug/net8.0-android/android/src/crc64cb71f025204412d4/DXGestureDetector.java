package crc64cb71f025204412d4;


public class DXGestureDetector
	extends android.view.GestureDetector
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onTouchEvent:(Landroid/view/MotionEvent;)Z:GetOnTouchEvent_Landroid_view_MotionEvent_Handler\n" +
			"";
		mono.android.Runtime.register ("DevExpress.Maui.Core.Android.Internal.DXGestureDetector, DevExpress.Maui.Core", DXGestureDetector.class, __md_methods);
	}


	public DXGestureDetector (android.content.Context p0, android.view.GestureDetector.OnGestureListener p1, android.os.Handler p2, boolean p3)
	{
		super (p0, p1, p2, p3);
		if (getClass () == DXGestureDetector.class) {
			mono.android.TypeManager.Activate ("DevExpress.Maui.Core.Android.Internal.DXGestureDetector, DevExpress.Maui.Core", "Android.Content.Context, Mono.Android:Android.Views.GestureDetector+IOnGestureListener, Mono.Android:Android.OS.Handler, Mono.Android:System.Boolean, System.Private.CoreLib", this, new java.lang.Object[] { p0, p1, p2, p3 });
		}
	}


	public DXGestureDetector (android.content.Context p0, android.view.GestureDetector.OnGestureListener p1, android.os.Handler p2)
	{
		super (p0, p1, p2);
		if (getClass () == DXGestureDetector.class) {
			mono.android.TypeManager.Activate ("DevExpress.Maui.Core.Android.Internal.DXGestureDetector, DevExpress.Maui.Core", "Android.Content.Context, Mono.Android:Android.Views.GestureDetector+IOnGestureListener, Mono.Android:Android.OS.Handler, Mono.Android", this, new java.lang.Object[] { p0, p1, p2 });
		}
	}


	public DXGestureDetector (android.content.Context p0, android.view.GestureDetector.OnGestureListener p1)
	{
		super (p0, p1);
		if (getClass () == DXGestureDetector.class) {
			mono.android.TypeManager.Activate ("DevExpress.Maui.Core.Android.Internal.DXGestureDetector, DevExpress.Maui.Core", "Android.Content.Context, Mono.Android:Android.Views.GestureDetector+IOnGestureListener, Mono.Android", this, new java.lang.Object[] { p0, p1 });
		}
	}


	public DXGestureDetector (android.view.GestureDetector.OnGestureListener p0, android.os.Handler p1)
	{
		super (p0, p1);
		if (getClass () == DXGestureDetector.class) {
			mono.android.TypeManager.Activate ("DevExpress.Maui.Core.Android.Internal.DXGestureDetector, DevExpress.Maui.Core", "Android.Views.GestureDetector+IOnGestureListener, Mono.Android:Android.OS.Handler, Mono.Android", this, new java.lang.Object[] { p0, p1 });
		}
	}


	public DXGestureDetector (android.view.GestureDetector.OnGestureListener p0)
	{
		super (p0);
		if (getClass () == DXGestureDetector.class) {
			mono.android.TypeManager.Activate ("DevExpress.Maui.Core.Android.Internal.DXGestureDetector, DevExpress.Maui.Core", "Android.Views.GestureDetector+IOnGestureListener, Mono.Android", this, new java.lang.Object[] { p0 });
		}
	}


	public boolean onTouchEvent (android.view.MotionEvent p0)
	{
		return n_onTouchEvent (p0);
	}

	private native boolean n_onTouchEvent (android.view.MotionEvent p0);

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
