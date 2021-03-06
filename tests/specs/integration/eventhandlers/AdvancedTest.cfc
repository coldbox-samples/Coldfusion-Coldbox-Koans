
/**
* My BDD Test
*/
component extends="coldbox.system.testing.BaseTestCase" appMapping="/"{

    /*********************************** LIFE CYCLE Methods ***********************************/
    
        // executes before all suites+specs in the run() method
        function beforeAll(){
            
        }
    
        // executes after all suites+specs in the run() method
        function afterAll(){
            
        }
    
    /*********************************** BDD SUITES ***********************************/
    
        function run( testResults, testBox ){
            // all your suites go here.
            describe( "Event handlers Advanced Test", function() {
    
                beforeEach(function( currentSpec ){
                    setup();
                    contactService = getInstance( "ContactService" );
                });
                
                // TODO add a no layout example
    
                it( "Can change the welcome message value", function() {
                    // We are going to execute an Event called eventHandler.welcomeMessage
                    // Find the corresponding Event Handler, and the method, and change the value rc.welcomeMessage to "32123161"
                    
                    var event = execute( "eventHandler.welcomemessage" );
                    expect( event.getValue( "welcomeMessage" ) ).toBe ( "32123161" );
                });

                it( "Can set a variable in the private request scope", function() {
                    // We are going to execute the Event called eventHandler.welcomeMessage again.
		            // Look for an eventHandler Handler and the appropriate method, add a variable called secretSauce to the private scope set to 98494113
                    
                    var event = execute( "eventHandler.welcomemessage" );
                    expect( event.getPrivateValue( "secretSauce" ) ).toBe ( "98494113" );
                });

                it( "Can set a view with no layout", function() {
                    // Display the `eventHandlers/noLayout` view with no layout
                    var event = execute( "eventHandler.noLayout" );
                    // Expectations
                    var prc = event.getPrivateCollection();
                    expect( StructKeyExists( prc, "currentLayout" )).notToBeTrue();
                });

                it( "Can set the view `MyView1`", function() {
                    // We are going to execute an Event called eventHandler.whereismyview1
		            // Find the corresponding Event Handler, and the method, and set the view for that method to view1.cfm, located somewhere in the view folder.
                    
                    var event = execute( "eventHandler.whereismyview1" );
                    // Expectations
                    var prc = event.getPrivateCollection();

                    expect( prc.currentView ).toBe( "view1" );
                });

                it( "Can set the view MyView2", function() {
                    // We are going to execute an Event called eventHandler.whereismyview2
                    // Find the corresponding Event Handler, and the method, and set the view for that method to view2.cfm, located somewhere in the view folder.
                    
                    var event = execute( "eventHandler.whereismyview2" );
                    // Expectations
                    var prc = event.getPrivateCollection();
                    expect( prc.currentView ).toBe( "main/view2" );
                });

                it( "Can set the view MyView3", function() {
                    // We are going to execute an Event called eventHandler.whereismyview3
                    // Find the corresponding Event Handler, and the method, and set the view for that method to view3.cfm, located somewhere in the view folder.
                    
                    var event = execute( "eventHandler.whereismyview3" );
                    // Expectations
                    var prc = event.getPrivateCollection();
                    expect( prc.currentView ).toBe( "eventHandler/view3" );
                });

                it( "Can fix the layout for welcome", function() {
                    // We are going to execute an Event called eventHandler.welcome for logged in users
                    // Find the corresponding Event Handler, and the method, and set the layout to use Admin.cfm not Main.cfm
                    // Hint, it is the setLayout function.
                    
                    var event = execute( "eventHandler.welcome" );
                    // Expectations
                    var prc = event.getPrivateCollection();
                    expect( prc.currentLayout ).toBe( "Admin.cfm" );
                });

                it( "Can fix the layout for login error", function() {
                    // We are going to execute an Event called eventHandler.loginError for errors
                    // Find the corresponding Event Handler, and the method, and set the layout to use Error.cfm not Main.cfm
                    // Hint, edit the setView function, and add an argument to set the layout at the same time you set the view.
                    
                    var event = execute( "eventHandler.loginError" );
                    // Expectations
                    var prc = event.getPrivateCollection();
                    expect( prc.currentLayout ).toBe( "Error.cfm" );
                });

                it( "Can relocate In ColdBox", function() {
                    // We are going to execute an Event called eventHandler.doSomething
                    // Then we are going to test to see if that event relocates to eventHandler.didSomething
                    // Add the coldbox syntax for relocation to eventHandler.didSomething into the eventHandler handler in the doSomething method.
                    
                    var event = execute( "eventHandler.doSomething" );
                    // Expectations
                    expect( event.getCollection().relocate_event ).toBe( "eventHandler/didSomething" );
                });

                it( "Can relocate when a good login", function() {
                    // We are going to execute an Event called eventHandler.login
                    // Relocation Test - Add the coldbox syntax for relocation to eventHandler.welcome for a Good Login
                    // Add the coldbox syntax for relocation to eventHandler.welcome if the username and password are correct
                    getRequestContext()
                        .setValue( "username", "rose" )
                        .setValue( "password", "badwolf" );

                    var event = execute( "eventHandler.login" );

                    // Expectations
                    expect( event.getCollection().relocate_event ).toBe( "eventHandler/welcome" );
                });

                it( "Can relocate when bad login", function() {
                    // We are going to execute an Event called eventHandler.login
                    // Relocation Test - Add the coldbox syntax for relocation to eventHandler.loginError for a Bad Login
                    
                    getRequestContext()
                        .setValue( "username", "rose" )
                        .setValue( "password", "password" );

                    var event = execute( "eventHandler.login" );
                    // Expectations
                    expect( event.getCollection().relocate_event ).toBe( "eventHandler/loginError" );
                });

                it( "Should execute another event", function() {
                    // We are going to execute an Event called eventHandler.executeAnotherEvent
                    // Find the corresponding Event Handler, and the method, and add the syntax to execute the public event eventHandler.publicSecret
                    // The eventHandler.publicSecret event will set a variable in the PRC for us to verify.
                    
                    var event = execute( "eventHandler.executeAnotherEvent" );
                    // Expectations
                    expect( event.getPrivateCollection().BestCompanion ).toBe( "Rose" );
                });

                it( "Should execute a private event", function() {
                    // We are going to execute an Event called eventHandler.executeAnotherEventPrivate
                    // Find the corresponding Event Handler, and the method, and add the syntax to execute the private event eventHandler.privateSecret
                    // The eventHandler.privateSecret event will set a variable in the PRC for us to verify.
                    
                    var event = execute( "eventHandler.executeAnotherEventPrivate" );
                    // Expectations
                    expect( event.getPrivateCollection().OldestFriend ).toBe( "Jack" );

                });

                it( "Can create a new handler", function() {
                    // We are going to execute an Event called Contacts
                    // Make a new Handler called Contacts and a Method to catch this event and set a variable rc.welcomeMessage to "919643641"
                    
                    var event = execute( event="contacts.index", renderResults=false );
                    // Do your asserts below
                    expect(	event.getValue( name="welcomemessage" ) ).toBe( "919643641" );
                    // TODO renderResults
                });

                it( "Can create a new handler action", function() {
                    // We are going to execute an Event called expertEvent.mySecondAction
                    // Make a new Handler and Method to catch the expertEvent.mySecondAction event and set a variable rc.welcomeMessage to ThisIsEasy
                    
                    var event = execute( "contacts.myFirstHandlerAction" );
                    // Do your expectations below
                    expect(	event.getCurrentAction() ).toBe( "myFirstHandlerAction" );

                });

                it( "Can return contacts as JSON", function() {
                    // Using the `list` method of ContactService you created in the models section, return the contact list as JSON
                    // Inject the ContactService in the handler and call the `list` method and make sure you return the list as JSON
                    
                    var event = execute( "contacts.returnListAsJSON" );                    
                    var results = event.getPrivateCollection();
                    // Expectations
                    expect( results.cbox_renderdata.type ).toBe( "JSON" );
                });

                // Story - Present a contact card in JSON, HTML and PDF

                story( "I need to present a contact card in different formats", function(){
                    given( "A contact card in JSON", function(){
                        then( "I should render a contact card in JSON format", function(){                            
                            var event = execute( "contacts.returnContactAsJSON" );
                            var results = event.getPrivateCollection();
                            // Expectations
                            expect( results.cbox_renderdata.type ).toBe( "JSON" );
                        });	
                    });
                    given( "A contact card in HTML", function(){
                        then( "I should render a contact card in HTML format", function(){
                            var event = execute( "contacts.returnContactAsHTML" );
                            var results = event.getPrivateCollection();
                            // Expectations
                            expect( results.cbox_renderdata.type ).toBe( "HTML" );
                        });	
                    });
                    given( "A contact card in PDF", function(){
                        then( "I should render a contact card in PDF format", function(){
                            var event = execute( "contacts.returnContactAsPDF" );
                            var results = event.getPrivateCollection();
                            // Expectations
                            expect( results.cbox_renderdata.type ).toBe( "PDF" );
                        });	
                    });
                });	
   
            });
        }
        
        
    }

