component accessors="true" {

	property name="baseURL" type="string";

	/**
	* Init constructor
	*/
	public function init(
		string baseURL = 'https://baconipsum.com/api/'
	){
		setBaseURL( arguments.baseURL );
		return this;
	}

	/**
	* Make request to API
	* @type Options are 'all-meat' for meat only or 'meat-and-filler' for meat mixed with miscellaneous ‘lorem ipsum’ filler.
	* @paras optional number of paragraphs, defaults to 5
	* @sentences number of sentences (this overrides paragraphs)
	* @startWithLorem Default is 'false'. Pass 'true' to start the first paragraph with 'Bacon ipsum dolor'
	* @format Default is 'json'. Options are 'json', 'text' or 'html'
	*/
	public function getPiggyWithIt(
		required string type = 'all-meat',
		numeric paras,
		numeric sentences,
		boolean startWithLorem = false,
		string format          = 'json',
		boolean deserialize    = false
	){
		var sParams = structCopy( arguments );
		structInsert( sParams, 'start-with-lorem', ( arguments.startWithLorem ) ? 1 : 0 );
		structDelete( sParams, 'startWithLorem' );
		var strURL = prepParams(
			url    = getBaseURL(),
			params = sParams
		);
		var httpService = new http( method='GET', url=strURL );
		var result = httpService.send().getPrefix();
		if( arguments.format == 'json' && arguments.deserialize ){
			return deserializeJSON( result.fileContent );
		} else {
			return result.fileContent;
		}
	}

	/**
	* I prepare the parameters for the request
	* @url The URL used for the request
	* @params The struct of parameters
	*/
	private function prepParams(
		required string url,
		required struct params
	){
		var strURL  = arguments.url;
		var sParams = structCopy( arguments.params );
			structDelete( sParams, 'deserialize' );
		var intTotalParams = structCount( sParams );
		if( intTotalParams ){
			var intCount = 1;
			strURL = strURL & '?';
			for( var param in sParams ){
				if( structKeyExists( sParams, param ) ){
					strURL = strURL & param & '=' & sParams[param];
					if( intCount < intTotalParams ){
						strURL = strURL & '&';
					}
				}
				intCount = intCount+1;
			}
		}
		return strURL;
	}

	/**
	* Returns the properties as a struct
	*/
	public struct function getMemento(){
		var result = {};
		for( var thisProp in getMetaData( this ).properties ){
			if( structKeyExists( variables, thisProp[ 'name' ] ) ){
				result[ thisProp[ 'name' ] ] = variables[ thisProp[ 'name' ] ];
			}
		}
		return result;
	}


}