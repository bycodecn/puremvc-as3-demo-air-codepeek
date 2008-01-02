/*
 CodePeek - Copyright(c) 2007 FutureScale, Inc., All rights reserved.
 */
package org.puremvc.as3.demos.air.codepeek
{
	import org.puremvc.interfaces.*;
	import org.puremvc.patterns.proxy.*;
	import org.puremvc.patterns.facade.*;

	import org.puremvc.as3.demos.air.codepeek.view.*;
	import org.puremvc.as3.demos.air.codepeek.model.*;
	import org.puremvc.as3.demos.air.codepeek.controller.*;

	/**
	 * A concrete <code>Facade</code> for the <code>CodePeek</code> application.
	 * <P>
	 * The main job of the <code>ApplicationFacade</code> is to act as a single 
	 * place for mediators, proxies and commands to access and communicate
	 * with each other without having to interact with the Model, View, and
	 * Controller classes directly. All this capability it inherits from 
	 * the PureMVC Facade class.</P>
	 * 
	 * <P>
	 * This concrete Facade subclass is also a central place to define 
	 * notification constants which will be shared among commands, proxies and
	 * mediators, as well as initializing the controller with Command to 
	 * Notification mappings.</P>
	 */
	public class ApplicationFacade extends Facade
	{
		
		// Notification name constants
		public static const APP_STARTUP:String			= "appStartup";
		public static const APP_SHUTDOWN:String			= "appShutdown";
		
		public static const MODEL_PERSIST_PREFS:String	= "modelPersistPrefs";
		public static const MODEL_PERSIST_DB:String		= "modelPersistDB";
		
		public static const VIEW_SET_DEFAULT:String		= "viewSetDefault";
		public static const VIEW_SET_BOUNDS:String		= "viewSetBounds";
		public static const VIEW_SET_FULLSCREEN:String	= "viewSetFullScreen";
		public static const VIEW_SHOW_WINDOW:String		= "viewShowWindow";
		public static const VIEW_SHOW_CONTROLS:String	= "viewShowControls";

		public static const CODE_SEARCH_SUCCESS:String	= "codeSearchSuccess";
		public static const CODE_SEARCH_FAILED:String	= "codeSearchFailed";
		public static const SEARCH_TYPE_SELECTED:String	= "searchTypeSelected";
		public static const SEARCH_SELECTED:String		= "searchSelected";
		
		/**
		 * Singleton ApplicationFacade Factory Method
		 */
		public static function getInstance() : ApplicationFacade {
			if ( instance == null ) instance = new ApplicationFacade( );
			return instance as ApplicationFacade;
		}

		/**
		 * Register Commands with the Controller 
		 */
		override protected function initializeController( ) : void 
		{
			super.initializeController();			
			registerCommand( APP_STARTUP, 
							org.puremvc.as3.demos.air.codepeek.controller.ApplicationStartupCommand );
			registerCommand( APP_SHUTDOWN, 
							org.puremvc.as3.demos.air.codepeek.controller.ApplicationShutdownCommand );
		}
		
		/**
		 * The view hierarchy has been built, so start the application.
		 */
		public function startup(app:CodePeek):void
		{
			facade.notifyObservers ( new Notification( ApplicationFacade.APP_STARTUP, app ) );
		}
		
		
	}
}