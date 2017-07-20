import { requireNativeComponent, NativeModules, NativeEventEmitter } from 'react-native';
const {BMKSearchManager} = NativeModules;
const searchEventEmitter = new NativeEventEmitter(BMKSearchManager);

const POISearch = {
  searchNearBy(poiNearBySearchOption) {
    BMKSearchManager.poiSearchNearBy(poiNearBySearchOption);
  },
  searchInCity(poiCitySearchOption) {
    BMKSearchManager.poiSearchInCity(poiCitySearchOption);
  },
  searchInBounds(poiBoundSearchOption) {
    BMKSearchManager.poiSearchInbounds(poiBoundSearchOption);
  },
  detailSearch(poiDetailSearchOption) {
    BMKSearchManager.poiDetailSearch(poiDetailSearchOption);
  },

  onSuccess(handler) {
    if (this.successSubscription) {
      this.successSubscription.remove();
    }
    if(handler) {
      this.successSubscription = searchEventEmitter.addListener('searchPoiSuccess', handler);
    }
  },
  onFailed(handler) {
    if (this.failedSubscription) {
      this.failedSubscription.remove();
    }
    if(handler) {
      this.failedSubscription = searchEventEmitter.addListener('searchPoiFailed', handler);
    }
  },
  onDetailSearchSuccess(handler) {
    if (this.detailSuccessSubscription) {
      this.detailSuccessSubscription.remove();
    }
    if(handler) {
      this.detailSuccessSubscription = searchEventEmitter.addListener('searchPoiDetailSuccess', handler);
    }
  },
  onDetailSearchFailed(handler) {
    if (this.detailFailedSubscription) {
      this.detailFailedSubscription.remove();
    }
    if(handler) {
      this.detailFailedSubscription = searchEventEmitter.addListener('searchPoiDetailFailed', handler);
    }
  },
  // onSuggestionSearchSuccess(handler) {
  //   if (this.suggestionSearchFailedSubscription) {
  //     this.suggestionSearchFailedSubscription.remove();
  //   }
  //   if(handler) {
  //     this.suggestionSearchFailedSubscription = searchEventEmitter.addListener('suggestionSearchSuccess', handler);
  //   }
  // },
  // onSuggestionSearchFailed()
};

export default POISearch;
