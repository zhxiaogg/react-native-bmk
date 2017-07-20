import { requireNativeComponent, NativeModules, NativeEventEmitter } from 'react-native';
const {BMKSearchManager} = NativeModules;
const searchEventEmitter = new NativeEventEmitter(BMKSearchManager);


const Geocode = {
  geocode(option) {
    BMKSearchManager.geocode(option);
  },

  reverseGeocode(option) {
    BMKSearchManager.reverseGeocode(option);
  },

  onGeocodeSuccess(handler) {
    if (this.geocodeOkSubscription) {
      this.geocodeOkSubscription.remove();
    }
    if(handler) {
      this.geocodeOkSubscription = searchEventEmitter.addListener('geoCodeSuccess', handler);
    }
  },
  onGeocodeFailed(handler) {
    if (this.geocodeFailedSubscription) {
      this.geocodeFailedSubscription.remove();
    }
    if(handler) {
      this.geocodeFailedSubscription = searchEventEmitter.addListener('geoCodeFailed', handler);
    }
  },
  onReverseGeocodeSuccess(handler) {
    if (this.reverseGeocodeOkSubscription) {
      this.reverseGeocodeOkSubscription.remove();
    }
    if(handler) {
      this.reverseGeocodeOkSubscription = searchEventEmitter.addListener('reverseGeoCodeSuccess', handler);
    }
  },
  onReverseGeocodeFailed(handler) {
    if (this.reverseGeocodeFailedSubscription) {
      this.reverseGeocodeFailedSubscription.remove();
    }
    if(handler) {
      this.reverseGeocodeFailedSubscription = searchEventEmitter.addListener('reverseGeoCodeFailed', handler);
    }
  }
};

export default Geocode;
