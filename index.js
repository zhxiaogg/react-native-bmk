import { requireNativeComponent, NativeModules, NativeEventEmitter } from 'react-native';
const {BMKLocationServiceManager} = NativeModules;
const locationServiceEventEmitter = new NativeEventEmitter(BMKLocationServiceManager);
import BMKMapManager from './libs/BMKMapManager';

//TODO: due to the native modules' singleton nature, BMKLocationService can only be initialized once.
class BMKLocationService {

  constructor(locationServiceDelegate) {
    const eventNames = [
      "willStartLocatingUser",
      "didStopLocatingUser",
      "didUpdateUserHeading",
      "didUpdateBMKUserLocation",
      "didFailToLocateUserWithError"
    ];

    eventNames.forEach((eventName) => {
      const handler = locationServiceDelegate[eventName];
      if(handler) {
        locationServiceEventEmitter.addListener(eventName, (value) => handler(value));
      }
    });
  }

  async startUserLocationService() {
    await BMKLocationServiceManager.startUserLocationService();
    console.log('location service started.')
  }

  async stopUserLocationService() {
    await BMKLocationServiceManager.stopUserLocationService();
    console.log('location service stopped.')
  }
}

module.exports = {
  'BMKMapView': requireNativeComponent('BMKMapView', null),
  'BMKLocationService': BMKLocationService,
  'BMKMapManager': BMKMapManager
}
