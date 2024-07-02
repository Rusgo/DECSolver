package crc64cb71f025204412d4;


public class DXPanAndSwipeGestureListener
	extends android.view.GestureDetector.SimpleOnGestureListener
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onFling:(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z:GetOnFling_Landroid_view_MotionEvent_Landroid_view_MotionEvent_FFHandler\n" +
			"";
		mono.android.Runtime.register ("DevExpress.Maui.Core.Android.Internal.DXPanAndSwipeGestureListener, DevExpress.Maui.Core", DXPanAndSwipeGestureListener.class, __md_methods);
	}


	public DXPanAndSwipeGestureListener ()
	{
		super ();
		if (getClass () == DXPanAndSwipeGestureListener.class) {
			mono.android.TypeManager.Activate ("DevExpress.Maui.Core.Android.Internal.DXPanAndSwipeGestureListener, DevExpress.Maui.Core", "", this, new java.lang.Object[] {  });
		}
	}


	public boolean onFling (android.view.MotionEvent p0, android.view.MotionEvent p1, float p2, float p3)
	{
		return n_onFling (p0, p1, p2, p3);
	}

	private native boolean n_onFling (android.view.MotionEvent p0, android.view.MotionEvent p1, float p2, float p3);

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
