component extends='testbox.system.BaseSpec'{
	
	/*********************************** BDD SUITES ***********************************/
	
	function beforeAll(){

		oBaconLipsum = new baconLipsum();

	}

	function run(){

		describe( 'Bacon Lipsum Component Suite', function(){
			
			it( 'should return the correct object', function(){

				expect( oBaconLipsum ).toBeInstanceOf( 'baconLipsum' );
				expect( oBaconLipsum ).toBeTypeOf( 'component' );

			});

			it( 'should have the correct properties', function() {

				var sMemento = oBaconLipsum.getMemento();

				expect( sMemento ).toBeStruct().toHaveLength( 1 );

				expect( sMemento ).toHaveKey( 'baseURL' );

				expect( sMemento[ 'baseURL' ] ).toBeString();

			} );

			it( 'should have the correct methods', function() {

				makePublic( oBaconLipsum, 'prepParams', 'prepParams' );

				expect( oBaconLipsum ).toHaveKey( 'init' );
				expect( oBaconLipsum ).toHaveKey( 'getPiggyWithIt' );
				expect( oBaconLipsum ).toHaveKey( 'prepParams' );
				expect( oBaconLipsum ).toHaveKey( 'getBaseURL' );
				expect( oBaconLipsum ).toHaveKey( 'getMemento' );

			} );


			it( 'should return an array for the deserialized JSON format call', function(){

				var resp = oBaconLipsum.getPiggyWithIt(
					format      = 'json',
					deserialize = true
				);

				expect( resp )
					.toBeArray()
					.toHaveLength( 5 );

				var resp = oBaconLipsum.getPiggyWithIt(
					paras       = 2,
					format      = 'json',
					deserialize = true
				);

				expect( resp )
					.toBeArray()
					.toHaveLength( 2 );

				var resp = oBaconLipsum.getPiggyWithIt(
					sentences   = 2,
					format      = 'json',
					deserialize = true
				);

				expect( resp )
					.toBeArray()
					.toHaveLength( 1 );

				expect( listLen( resp[ 1 ], '.' ) ).toBe( 2 );

			} );

			it( 'should return a string for the serialized JSON format call', function(){

				var resp = oBaconLipsum.getPiggyWithIt(
					format      = 'json',
					deserialize = false
				);

				expect( resp ).toBeString();

			} );

			it( 'should return a string for the text format call', function(){

				var resp = oBaconLipsum.getPiggyWithIt(
					format      = 'text',
					deserialize = false
				);

				expect( resp ).toBeString();

				expect( left( resp, 17 ) ).notToBe( 'Bacon ipsum dolor' );

			} );

			it( 'should return a string for the html format call', function(){

				var resp = oBaconLipsum.getPiggyWithIt(
					format      = 'html',
					deserialize = false
				);

				expect( resp ).toBeString();

			} );

			it( 'should return a string that starts with "Bacon ipsum dolor"', function(){

				var resp = oBaconLipsum.getPiggyWithIt(
					type           = 'meat-and-filler',
					format         = 'text',
					startWithLorem = true,
					deserialize    = false
				);

				expect( resp ).toBeString();

				expect( left( resp, 17 ) ).toBe( 'Bacon ipsum dolor' );

			} );

		});

	}
	
}
