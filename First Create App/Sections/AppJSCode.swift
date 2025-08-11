//
//  AppJSCode.swift
//  MainCRM
//
//  Created by Main on 19.03.2025.
//

import Foundation

struct AppJSCode {
    var domain: String
    var appName: String
    
    func getAppJsCode() -> String {
        return """
// Скопировать код App.tsx
import React, {useRef, useState, useEffect} from 'react';
import {ActivityIndicator, StyleSheet, View, Dimensions,BackHandler} from 'react-native';
import WebView from 'react-native-webview';
import App1 from './App1';

const server = {
url: '\(domain)'
}
const appName = '\(appName)'


const WebScreen = ({weblink, setShowWeb}) => {
const webViewRef = useRef()
const [indicator, setIndicator] = useState(true);

const handleBackButtonPress = () => {
try {
webViewRef.current?.goBack()
} catch (err) {
console.log("[handleBackButtonPress] Error : ", err.message)
}

return true;
}

useEffect(() => {
BackHandler.addEventListener("hardwareBackPress", handleBackButtonPress)
return () => {
BackHandler.removeEventListener("hardwareBackPress", handleBackButtonPress)
};
}, []);

return (
<View style={{flex: 1}}>
<WebView
source={{
uri: weblink,
}}
ref={webViewRef}
onMessage={event => {}}
javaScriptEnabled={true}
onLoadEnd={syntheticEvent => {
setIndicator(false);
}}
allowsInlineMediaPlayback={true}
onHttpError={syntheticEvent => {
const {nativeEvent} = syntheticEvent;
if(nativeEvent.statusCode === 404) setShowWeb(false)
}}
onError={err => {
console.log(err);
}}
/>
{indicator && (
<View style={styles.loader}>
<ActivityIndicator color="#000" size="large" />
</View>
)}
</View>
);
};

function App() {
const [showWeb, setShowWeb] = useState(false)
const [showContent, setShowContent] = useState(false)
const [weblink, setWeblink] = useState("")

useEffect(() => {
fetch(server.url + '/' + appName + '_startRequest.php')
.then(res => res.json())
.then(data => {
if(data.res) {
    setWeblink(data.weblink)
    setShowWeb(true)
}
})
.catch(err => setShowWeb(false))
.finally(some => setShowContent(true))
}, [])

const renderContent = () => {
return showWeb ? <WebScreen setShowWeb={setShowWeb} weblink={weblink} /> : <App1 />
}

return showContent ? renderContent() : (
<View style={styles.cont}>
<ActivityIndicator size={'large'} />
</View>
)
}

const styles = StyleSheet.create({
cont: {
flex:1,
alignItems:'center',
justifyContent:'center'
},
loader: {
position: 'absolute',
width: 55,
height: 55,
top: Dimensions.get('window').height / 2 - 25,
left: Dimensions.get('window').width / 2 - 25,
},
})

export default App


"""
    }
}
