import { requireNativeComponent, NativeModules, NativeEventEmitter } from 'react-native';
const {BMKSearchManager} = NativeModules;
const searchEventEmitter = new NativeEventEmitter(BMKSearchManager);

const SuggestionSearch = {
  search(option) {
    BMKSearchManager.suggestionSearch(option);
  },

  onSuccess(handler) {
    if (this.successSubscription) {
      this.successSubscription.remove();
    }
    if(handler) {
      this.successSubscription = searchEventEmitter.addListener('suggestionSearchSuccess', handler);
    }
  },
  onFailed(handler) {
    if (this.failedSubscription) {
      this.failedSubscription.remove();
    }
    if(handler) {
      this.failedSubscription = searchEventEmitter.addListener('suggestionSearchFailed', handler);
    }
  }
};

export default SuggestionSearch;
