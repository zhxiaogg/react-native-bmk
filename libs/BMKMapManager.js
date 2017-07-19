import { requireNativeComponent, NativeModules, NativeEventEmitter } from 'react-native';
const {BMKMapManagerManager} = NativeModules;

export default class BMKMapManager {
  initialize(key) {
    BMKMapManagerManager.initialize(key);
  }
}
