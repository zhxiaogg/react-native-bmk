# react-native-bmk

react native bridge for baidu map.

## Usage

### step 1. install npm package

```
npm install react-native-bmk --save
```
### step 2. add baidu map sdk to the .xcodeproj

see [configure sdk](http://lbsyun.baidu.com/index.php?title=iossdk/guide/buildproject)

### step 3. setup baidu map sdk before app starts

see [set up map manager](http://lbsyun.baidu.com/index.php?title=iossdk/guide/hellobaidumap)

### step 4. create your react native view
in your 'index.ios.js' file:
```jsx
import BMKMapView from 'react-native-bmk'

render() {
  return (
      <View style={styles.container}>
        <BMKMapView style={styles.map} />
      </View>
    );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingLeft: 0,
  },
  map: {
    flex: 1,
  },
});
```

## TODO (& milestone)

- [ ] ios
  - [ ] Base Module
  - [ ] MapView Module
    - [x] MapView(basic properties & methods)
    - [x] MapView(events)
    - [x] MapView(LocationViewAPI)
    - [ ] MapView(AnnotationAPI)
    - [ ] MapView(HeatMapAPI)
    - [ ] MapView(InDoorMapAPI)
    - [ ] MapView(OverlaysAPI)
  - [ ] Search Module
  - [ ] Location Module
  - [ ] Cloud Module
  - [ ] Radar Module
  - [ ] Utils Module
- [ ] Android (not supported yet, open for contribution)

## Versioning

`major.minor.patch`, the minor value is the BaiduMap SDK version.
eg: `0.332.0` indicates this package is built with BaiduMap SDK `3.3.2`.
For bug fix or other code push, we simply bump the patch version.

## contribute

TODO, I will introduce a detail explaination on how to create this project from scratch.
