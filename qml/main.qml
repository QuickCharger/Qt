import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.2
import QtQuick.XmlListModel 2.0
import QtMultimedia 5.5
import QtQuick.Particles 2.0

//Image{      //最先的Image最先绘制，运行效果是被任何Image覆盖!!!
//    id: image       //可选,不能改变,可以直接被引用
//    width: 100
//    height: 100
//    anchors.centerIn: parent    //中心对齐,centerIn是anchors的属性
//    source: "image/1.png"

//    Behavior on rotation{   //定义rotation行为
//        NumberAnimation{
//            duration : 250
//        }
//    }
//    focus: true     //如果没有设置焦点，按键就没输入!!!
//    Keys.onSpacePressed:  rotation += 90
//    fillMode: Image.Stretch      //避免参见图像数据被渲染到图像边界
//    clip: true      //裁剪，默认关闭
//}


//Item{
//    width: background.width;
//    height: background.height

//    Image{
//        id: background
//        source: "image/bg.png"
//    }

//    MouseArea{
//        id: backgroundClicker
//        anchors.fill: parent
//        onClicked:{
//            rocket1.x = 20
//            rocket2.rotation = 0;
//            rocket3.rotation = 0;
//            rocket3.scale = 1.0;
//        }
//    }

//    Image{
//        id: rocket1
//        x: 20
//        y: 100
//        height: 100
//        width: 100
//        source: "image/1.png"
//        MouseArea{
//            anchors.fill: parent
//            onClicked: rocket1.x += 5
//        }
//    }

//    Image{
//        id: rocket2
//        x: 140
//        y: 100
//        height: 100
//        width: 100
//        source: "image/1.png"
//        MouseArea{
//            anchors.fill: parent
//            onClicked: rocket2.rotation += 5
//        }
//    }

//    Image{
//        id: rocket3
//        x: 260
//        y: 100
//        height: 100
//        width: 100
//        source: "image/1.png"
//        MouseArea{
//            anchors.fill: parent
//            onClicked: {
//                rocket3.rotation += 5
//                rocket3.scale -= 0.05
//            }
//        }
//    }
//}


    ////通过这种方式，一个对象可以将一些特定的值暴露给其它对象，或者是更加简便的维护一些内部状态。 Property属性的名称必须以小写字母开头，且只能包含字母，数字和下划线
    ////定义一个自定义的property属性也就为该property属性隐式的创建了一个value-change信号，也就是关联了一个名为on<PropertyName>Changed的signal handler。<PropertyName>就是property属性的名称，而且首字母要大写。
    ////另一个重要的声明属性的方法是使用alias关键字（property alias : ）。alias关键字允许我们转发一个属性或者转发个属性对象自身到另一个作用域。我们将在后面定义组件导出内部属性或者引用根级元素id会使用到这个技术。一个属性别名不需要类型，它使用引用的属性类型或者对象类型。
//    property variant colorArray: ["blue", "green", "grey", "red", "yellow", "dard"]


//Column{     //对应的layout有Row,Grid,Flow
//    id: columnn
//    anchors.centerIn: parent
//    spacing: 8

//    Rectangle{
//        color: "red"
//        width: 50; height: 26
//        border.color: Qt.light(color, 1.1)
//        border.width: 3
//    }
//    Rectangle{
//        color: "green"
//        width: 50 * 2; height: 26;
//        border.color: Qt.light(color, 1.1)
//        border.width: 3
//    }
//    Rectangle{
//        color: "blue"
//        width: 50; height: 26;
//        border.color: Qt.light(color, 1.1)
//        border.width: 3
//    }
//}


////property int colorIndex: Math.floor(Math.random() * (root.colorArray.length - 0))
//Rectangle{
//    id: root
//    width: 252
//    height: 222
//    property variant colorArray: ["white", "black", "cyan", "darkCyan", "red", "darkRed", "magenta", "darkMagenta", "green", "darkGreen", "yellow", "darkYellow", "blue", "darkBlue", "gray", "darkGray"]

//    Grid{
//        anchors.fill: parent
//        anchors.margins: 8
//        spacing: 4
//        Repeater{       //一个重复元素循环时有一个index（索引）属性值。
//            model: colorArray.length
//            //如此做法rectangle中可以直接使用modelData
//            //model: ["white", "black", "cyan", "darkCyan", "red", "darkRed", "magenta", "darkMagenta", "green", "darkGreen", "yellow", "darkYellow", "blue", "darkBlue", "gray", "darkGray"]
//            Rectangle{
//                width: 56; height: 56;
//                color: root.colorArray[index]
//                border.color: Qt.lighter(color)
//                Text{
//                    anchors.centerIn: parent
//                    color: "black"
//                    text: "Cell" + index
//                }
//            }
//        }
//    }
//}


//Rectangle{
//    width: 640; height: 480
//    color: "grey"
//    Grid{
//        anchors.fill: parent
//        anchors.margins: 8
//        spacing: 4
//        columns: 3  //三列

//        Rectangle{
//            width: 100; height: 100
//            color: "green"
//            Rectangle{
//                width: 12
//                anchors.fill: parent        //填充
//                anchors.margins: 8
//                color: "cyan"
//                Text{
//                    anchors.centerIn: parent
//                    text: "(1)"
//                }
//            }
//        }

//        Rectangle{
//            width: 100; height: 100
//            color: "green"
//            Rectangle{
//                width: 40; height: 40;
//                anchors.left: parent.left   //左对齐
//                anchors.top: parent.top
//                anchors.margins: 4
//                color: "cyan"
//                Text{
//                    anchors.centerIn: parent
//                    text: "(2)"
//                }
//            }
//        }

//        Rectangle{
//            width: 100; height: 100
//            color: "green"
//            Rectangle{
//                width: 40; height: 40;
//                anchors.left: parent.right
//                color: "cyan"
//                Text{
//                    anchors.centerIn: parent
//                    text: "(3)"
//                }
//            }
//        }

//        Rectangle{
//            width: 100; height: 100
//            color: "green"
//            Rectangle{
//                id: blue1
//                width: 48; height: 24;
//                y: 8
//                color: "cyan"
//                anchors.horizontalCenter: parent.horizontalCenter   //中间对齐
//            }
//            Rectangle{
//                width: 48; height: 24;
//                anchors.top: blue1.bottom
//                anchors.horizontalCenter: blue1.horizontalCenter
//                anchors.margins: 8
//                color: "cyan"
//                Text{
//                    anchors.centerIn: parent
//                    text: "(4)"
//                }
//            }
//        }

//        Rectangle{
//            width: 100; height: 100
//            color: "green"
//            Rectangle{
//                width: 48; height: 48;
//                anchors.centerIn: parent    //居中
//                anchors.margins: 8
//                color: "cyan"
//                Text{
//                    anchors.centerIn: parent
//                    text: "(5)"
//                }
//            }
//        }

//        Rectangle{
//            width: 100; height: 100
//            color: "green"
//            Rectangle{
//                width: 48; height: 48;
//                anchors.horizontalCenter: parent.horizontalCenter   //水平对齐
//                anchors.verticalCenter: parent.verticalCenter
//                anchors.horizontalCenterOffset: 12 //水平偏移12像素
//                anchors.margins: 8
//                color: "cyan"
//                Text{
//                    anchors.centerIn: parent
//                    text: "(6)"
//                }
//            }
//        }
//    }
//}


//Rectangle{
//    width: 200
//    height: 80
//    color: "linen"
//    TextInput{
//        id: input1
//        x: 8; y: 8
//        width: 96; height: 20
//        focus: true
//        text: "Text Input1"
//        KeyNavigation.tab: input2
//    }
//    TextInput{
//        id: input2
//        x: 8; y: 36;
//        width: 96; height: 20
//        text: "Text Input2"
//        KeyNavigation.tab: input1
//    }
//}


//Item{
//    width: background.width;
//    height: background.height
//    anchors.fill: parent

//    Image{
//        id: background
//        source: "image/bg.png"

//        MouseArea{
//            anchors.fill: background
//            onClicked: rocket1.x += 5
//        }
//    }

//    Image{
//        id: rocket1
//        x: 20
//        y: 100
//        height: 100
//        width: 100

//        MouseArea{
//            anchors.fill: rocket1
//            onClicked: rocket1.x -= 5
//        }

//        source: "image/1.png"
//        smooth: true
//    }
//}


//Image{
//    id: image
//    source: "image/background.png"

//    Image{
//        id: pole
//        anchors.horizontalCenter: parent.horizontalCenter
//        anchors.bottom: parent.bottom
//        source: "image/pole.png"
//    }

//    Image{
//        id: wheel
//        anchors.centerIn: parent
//        source: "image/pinwheel.png"

//        MouseArea{
//            anchors.fill: parent
//            onClicked: wheel.rotation += 90
//        }

//        Behavior on rotation{
//            NumberAnimation{
//                duration: 250
//            }
//        }
//    }
//}


//Text{
//    id: label
//    x: 24; y: 16;
//    focus: true

//    property int spacePresses: 0

//    text: "Space pressed: " + spacePresses + "times"    //绑定，存在于整个生命周期

//    onTextChanged: console.log("text changed to: ", text)
//    Keys.onSpacePressed: increment()
//    Keys.onEscapePressed: label.text = ""

//    function increment(){
//        spacePresses = spacePresses + 1 //赋值，只会产生一次效果，当一个新的绑定生效或者使用JavaScript赋值给属性时，绑定的生命周期就会结束。
//    }
//}


//Rectangle{
//    id: rect
//    property alias text: label.text
//    signal clicked

//    width: 116; height: 26;
//    border.color: "slategrey"
//    radius: 7

//    Text{
//        id: label
//        anchors.centerIn: parent
//        text: "Start"
//    }

//    MouseArea{
//        anchors.fill: parent
//        onClicked: rect.clicked()
//    }

//    gradient: Gradient{
//        GradientStop{ position: 0; color: "blue"; }     //y轴的位置0，顶
//        GradientStop{ position: 1; color: "white"; }    //y轴的位置1，底
//    }
//}


//Rectangle{
//    Button{
//        id: button
//        x: 12; y: 12
//        text: "Start"
//        onClicked: {status.text = "Button clicked"; status.ab = 1;}
//    }

//    Text{   //默认宽度和高度依赖于字符串长度
//        id: status
//        x: 12; y: 76;
//        anchors.top: button.bottom
//        anchors.topMargin: 10
//        horizontalAlignment: Text.AlignHCenter

//        property int ab: 10;
//        onAbChanged: {
//            console.log("ab changed");
//        }

//        text: "waiting..."
//        color: "#303030"
//        font{ family: "Ubuntu"; pixelSize: 28; }
//        elide: Text.ElideMiddle     //过长的文本，用...显示，显示位置为中间
////        wrapMode: Text.WordWrap   //文字换行显示
//    }
//}


//Rectangle{
//    Rectangle{
//        id: rect1
//        x: 12; y: 12;
//        width: 76; height: 96;
//        color: "lightsteelblue"
//        MouseArea{
//            id: area
//            width: parent.width
//            height: parent.height
//            onClicked: rect2.visible = !rect2.visible
//        }
//    }

//    Rectangle{
//        id: rect2
//        x: 112; y: 12
//        width: 76; height: 96;
//        border.color: "lightsteelblue"
//        border.width: 4
//        radius: 8
//    }
//}


//Rectangle{
//    Button{
//        id: button
//        x: parent.width/2 - width/2;
//        y: 12
//        text: "Start"
//        onClicked: {
////            status.text = "Button clicked"
//            if(status.text == "Button clicked")
//                status.text = "Start"
//            else
//                status.text = "Button clicked"
//        }
//    }

//    Text{
//        id: status
//        x: parent.width/2 - width/2;
//        y: 76;
//        width: 116; height: 26
//        text: "waiting..."
//        horizontalAlignment: Text.AlignHCenter
//    }
//}


//Rectangle{
//    width: 400; height: 200;

//    Rectangle{
//        id: square
//        x: 8; y: 8
//        width: 100;
//        height: 100;
//        color: "black"
//    }

//    focus: true       //!!!
//    Keys.onLeftPressed: square.x -= 8;
//    Keys.onRightPressed: square.x += 8;
//    Keys.onUpPressed: square.y -= 8
//    Keys.onDownPressed: square.y += 8;
//    Keys.onPressed: {
//        switch(event.key)
//        {
//        case Qt.Key_Plus:
//            square.scale += 0.2
//            break;
//        case Qt.Key_Minus:
//            square.scale -= 0.2
//            break;
//        }
//    }
//}


//    Image{
//        id: image
//        source: "image/background.png"

//        property int padding: 40
//        property int duration: 4000
//        property bool running: false

//        Image{
//            id: box
//            x: image.padding
//            y: (image.height - height) / 2
//            source: "image/pinwheel.png"

//            NumberAnimation on x{
//                to: image.width - box.width - image.padding
//                duration: image.duration
//                running: image.running
//            }

//            NumberAnimation on rotation{
//                to: 360
//                duration: image.duration
//                running: image.running
//            }

//            NumberAnimation on scale{
//                to: 0.5
//                duration: image.duration
//                running: image.running
//            }

//            NumberAnimation on opacity{
//                to: 0.5
//                duration: image.duration
//                running: image.running
//            }

//            NumberAnimation on scale{
//                to: 2
//                duration: image.duration
//                running: image.running
//            }
//        }

//        MouseArea{
//            anchors.fill: parent
//            onClicked: image.running = true
//        }
//    }


////Each animation has a start(), stop(), resume(), restart() function.
//Row{
//    id: root
//    width: 300; height: 200
//    spacing: 8
//    ClickableImage{
//        id: greenBox
//        /*x: 40; */y: root.height - height
//        source: "image/blue.png"
//        text: "animation on property"
//        NumberAnimation on y{   //The animation starts immediately
//            to: 40
//            duration: 4000
//        }
//    }

//    ClickableImage{
//        id: blueBox
//        /*x: (root.width - width) / 2; */y: root.height - height
//        source: "image/blue.png"
//        text: "behavior on perperty"
//        Behavior on y{      //The object will start traveling when you click it (y-position is then set to 40)
//            NumberAnimation{ duration: 4000 }
//        }
//        onClicked: y = 40
//    }

//    ClickableImage{
//        id: redBox
//        /*x: root.width - width - 40; */y: root.height - height
//        source: "image/red.png"
//        onClicked: anim.start()
//        text: "standalone animation"
//        NumberAnimation{    //The click will start the animation using the animations function start()
//            id: anim
//            target: redBox
//            properties: "y"
//            to: 40
//            duration: 4000
//        }
//    }
//}


////未完成
//    Rectangle{
//        id: root
//        width: childrenRect.width
//        height: childrenRect.height
//        color: "#4a4a4a"
//        gradient: Gradient{
//            GradientStop{ position: 0.0; color: root.color; }
//            GradientStop{ position: 1.0; color: Qt.lighter(root.color, 1.2); }
//        }

//        ColumnLayout{
//            Grid{
//                spacing: 8
//                columns: 5

//                EasingType{
//                    easyingType: Easing.Linear
//                    title: "Linear"
//                    onClicked: {
//                        animation.easing.type = easingType
//                        box.toggle = !box.toggle
//                    }
//                }
//                EasingType{
//                    easyingType: Easing.InExpo
//                    title: "InExpo"
//                    onClicked: {
//                        animation.easing.type = easingType
//                        box.toggle = !box.toggle
//                    }
//                }
//                EasingType{
//                    easingType: Easing.OutExpo
//                    title: "outExpo"
//                    onClicked: {
//                        animation.easing.type = easingType
//                        box.tggle = !box.toggle
//                    }
//                }
//                EasingType{
//                    easingType: Easing.InOutExpo
//                    title: "InOutExpo"
//                    onClicked: {
//                        animation.easing.type = easingType
//                        box.toggle = !box.toggle
//                    }
//                }
//                EasingType{
//                    easingType: Easing.InOutCubic
//                    title: "InOutCubic"
//                    onClicked: {
//                        animation.easing.type = easingType
//                        box.toggle = !box.toggle
//                    }
//                }
//                EasingType{
//                    easingType: Easing.SineCurve
//                    title: "SineCurve"
//                    onClicked: {
//                        animation.easing.type = easingType
//                        box.toggle = !box.toggle
//                    }
//                }
//                EasingType{
//                    easingTYpe: Easing.InOutCirc
//                    title: "InOutCirc"
//                    onClicked: {
//                        animation.easing.type = easingType
//                        box.toggle = !box.toggle
//                    }
//                }
//                EasingType{
//                    easingType: Easing.InOutElastic
//                    title: "InOutElastic"
//                    onClicked: {
//                        animation.easing.type = easingType
//                        box.toggle = !box.toggle
//                    }
//                }
//                EasingType{
//                    easingType: Easing.InOutBack
//                    title: "InOutBack"
//                    onClicked: {
//                        animation.easing.type = easingType
//                        box.toggle = !box.toggle
//                    }
//                }
//                EasingType{
//                    easingType: Easing.InOutBounce
//                    title: "InOutBounce"
//                    onClicked: {
//                        animation.easing.type = easingType
//                        box.toggle = !box.toggle
//                    }
//                }
//            }

//            Item{
//                height: 80
//                Layout.fillWidth: true
//                Rectangle{
//                    id: box
//                    property bool toggle
//                    x: toffle ? 20 : root.width - width - 20
//                    anchors.verticalCenter: parent.verticalCenter
//                    gradient: Gradient{
//                        GradientStop { position: 0.0; color: "#2ed5fa" }
//                        GradientStop { position: 1.0; color: "#2467ec" }
//                    }
//                    Behavior on x{
//                        NumberAnimation{
//                            id: animation
//                            duration: 500
//                        }
//                    }
//                }
//            }
//        }
//    }


//Rectangle{
//    id: root
//    width: 600
//    height: 400
//    property int duration: 1000
//    property Item ufo: ufo

//    Image{
//        anchors.fill: parent
//        source: "image/background.png"
//    }

//    ClickableImage{
//        id: ufo
//        x: 20; y: root.height - height
//        text: "ufo"
//        source: "image/pinwheel.png"
//        onClicked: anim.restart()
//    }

//    ParallelAnimation{      //SequentialAnimation
//        id: anim
//        NumberAnimation{
//            target: ufo
//            properties: "y"
//            to: 20
//            duration: root.duration
//        }
//        NumberAnimation{
//            target: ufo
//            properties: "x"
//            to: 160
//            duration: root.duration
//        }
//    }
//}


//Item{
//    id: root
//    width: 640
//    height: 480
//    property int duration: 3000

//    Rectangle{
//        id: sky
//        width: parent.width
//        height: root.height
//        gradient: Gradient{
//            GradientStop{ position: 0.0; color: "#0080ff"; }
//            GradientStop{ position: 0.6; color: "#66ccff"; }
//            GradientStop{ position: 0.61; color: "#00ff00"; }
//            GradientStop{ position: 1.0; color: "#00803f"; }
//        }
//    }

//    Image{
//        id: ball
//        x: 0; y: root.height - height
//        source: "image/pinwheel.png"

//        MouseArea{
//            anchors.fill: parent
//            onClicked: {
//                ball.x = 0;
//                ball.y = root.height - ball.height;
//                ball.rotation = 0;
//                anim.restart();
//            }
//        }
//    }

//    ParallelAnimation{
//        id:anim

//        SequentialAnimation{
//            NumberAnimation{
//                target: ball
//                properties: "y"
//                to: 20
//                duration: root.duration * 0.4
//                easing.type: Easing.OutCirc
//            }
//            NumberAnimation{
//                target: ball
//                properties: "y"
//                to: 240
//                duration: root.duration * 0.6
//                easing.type: Easing.OutBounce
//            }
//        }

//        NumberAnimation{
//            target: ball
//            properties: "x"
//            to: 400
//            duration: root.duration
//        }

//        RotationAnimation{
//            target: ball
//            properties: "rotation"
//            to: 720
//            duration: root.duration
//        }
//    }
//}


//Rectangle{        //状态机
//    width: 320; height: 480;
//    anchors.fill: parent
//    Rectangle{
//        id: light1
//        x: 25; y: 15;
//        width: 100; height: width
//        radius: width / 2;
//        color: "black"
//        border.color: Qt.lighter(color, 1.1);
//    }
//    Rectangle{
//        id: light2
//        x: 25; y: 135;
//        width: 100; height: width
//        radius: width / 2
//        color: "black"
//        border.color: Qt.lighter(color, 1.1);
//    }

//    state: "stop"   //state是item的属性!!!

//    states: [
//        State {
//            name: "stop"
//            PropertyChanges { target: light1; color: "red"; }
//            PropertyChanges { target: light2; color: "black"; }
//        },
//        State {
//            name: "go"
//            PropertyChanges { target: light1; color: "black"; }
//            PropertyChanges { target: light2; color: "green"; }
//        }
//    ]

//    transitions: [      //过度,由状态的改变触发执行
//        Transition{
//            from: "stop"; to:"go";
//            ColorAnimation { target: light1; properties: "color"; duration: 500 }
//            ColorAnimation { target: light2; properties: "color"; duration: 500 }
//        },
//        Transition{
//            from: "go"; to: "stop";
//            ColorAnimation { target: light1; properties: "color"; duration: 500 }
//            ColorAnimation { target: light2; properties: "color"; duration: 500 }
//        }
//    ]

//    MouseArea{
//        anchors.fill: parent
//        onClicked: parent.state = (parent.state == "stop" ? "go" : "stop")
//    }
//}


//Rectangle{
//    width: 320; height: 480;
//    anchors.fill: parent
//    Rectangle{
//        id: light1
//        x: 25; y: 15;
//        width: 100; height: width
//        radius: width / 2;
//        color: "black"
//        border.color: Qt.lighter(color, 1.1);
//        Behavior on color{
//            ColorAnimation { target: light1; properties: "color"; duration: 500 }
//        }
//    }
//    Rectangle{
//        id: light2
//        x: 25; y: 135;
//        width: 100; height: width
//        radius: width / 2
//        color: "green"
//        border.color: Qt.lighter(color, 1.1);
//        Behavior on color{
//            ColorAnimation { target: light1; properties: "color"; duration: 500 }
//        }
//    }

//    MouseArea{
//        anchors.fill: parent
//        onClicked: {
//            light1.color = light1.color == "#000000" ? "green" : "black"
//            light2.color = light2.color == "#000000" ? "green" : "black"
//        }
//    }
//}


//Column{
//    spacing: 2
//    Repeater{
//        model: ["Enterprise", "Columbia", "Challenger", "Discovery"]
//        Rectangle{
//            width: 100
//            height: 32
//            radius: 3
//            color: "blue"
//            Text{
//                anchors.centerIn: parent
//                text: modelData + " (" + index + ")"
//            }
//        }
//    }
//}


////Repeater元素适合有限的静态数据，但在真正使用时，模型通常更加复杂和庞大
////QtQuick提供了ListView和GridView，这俩都是基于Flickable。可用于处理大型的数据
//Column{
//    spacing: 2
//    Repeater{
//        model: ListModel{
//            ListElement { name: "Mercury"; surfaceColor: "gray"; }
//            ListElement { name: "Venus"; surfaceColor: "yellow"; }
//            ListElement { name: "Earth"; surfaceColor: "blue"; }
//            ListElement { name: "Mars"; surfaceColor: "orange"; }
//            ListElement { name: "Jupiter"; surfaceColor: "orange"; }
//            ListElement { name: "Saturn"; surfaceColor: "yellow"; }
//            ListElement { name: "Uranus"; surfaceColor: "lightBlue"; }
//            ListElement { name: "Neptune"; surfaceColor: "lightBlue"; }
//        }

//        Rectangle{
//            width: 120
//            height: 32
//            radius: 3
//            color: "blue"
//            Text {
//                anchors.centerIn: parent
//                text: name
//            }

//            Rectangle{
//                anchors.left: parent.left
//                anchors.verticalCenter: parent.verticalCenter
//                anchors.leftMargin: 4
//                width: 16
//                height: 16
//                radius: 8
//                color: surfaceColor
//            }
//        }
//    }
//}


//Rectangle{
//    width: 400
//    height: 300
////    border.color: "black"
////    rotation: 20

//    ListView{
//        anchors.fill: parent
//        anchors.margins: 20
//        spacing: 5
//        clip: true
//        //默认值DragAndOvershootBounds 有回弹效果
//        boundsBehavior: Flickable.DragAndOvershootBounds
//        //默认值ListView.NoSnap 允许元素在任何位置停止。相似的有如下选项
//        //ListView.SnapToItem 视图顶部将会与元素对象的顶部对齐排列
//        //ListView.SnapOneItem 当鼠标或者触摸释放时，视图将会停在第一个可见的元素
//        snapMode: ListView.SnapToItem
//        model: 100
//        orientation: ListView.Horizontal
//        delegate: numberDelegate
//        layoutDirection: Qt.RightToLeft
//    }
//    Component{
//        id: numberDelegate
//        Rectangle{
//            width: 40
//            height: 40
//            color: "green"
//            Text{
//                horizontalAlignment: Text.AlignHCenter
//                verticalAlignment: Text.AlignVCenter
//                anchors.fill: parent
//                text: index;
//            }
//        }
//    }
//}


//Rectangle{
//    width:240; height: 300
//    color: "white"
//    ListView{
//        anchors.fill: parent
//        anchors.margins: 20
//        clip: true
//        model: 100
//        delegate: numberDelegate
//        spacing: 5
//        highlight: hightlightComponent
//        //默认值ListView.NoHighLightRange 意味着高亮与视图中的元素距离不相关
//        //ListView.StrictlyEnforceRange 强制高亮始终可见
//        //ListView.ApplyRange 尝试保持代理始终可见，但不会强制高亮始终可见
//        highlightRangeMode: ListView.StrictlyEnforceRange
//        focus: true
//    }

//    Component{
//        id: hightlightComponent
//        Rectangle{
//            width: ListView.view.width
//            color: "lightGreen"
//        }
//    }
//    Component{
//        id: numberDelegate
//        Item{
//            width: 40; height: 40
//            Text{
//                anchors.centerIn: parent
//                font.pixelSize: 10
//                text: index
//            }
//        }
//    }
//}


//Rectangle{
//    width: 240
//    height: 300
//    ListView{
//        id: view
//        anchors.fill: parent
//        anchors.margins: 20
//        clip: true
//        model: 100
//        delegate: numberDelegate
//        spacing: 5
//        highlight: highlightComponent
//        highlightRangeMode: ListView.StrictlyEnforceRange
//        highlightFollowsCurrentItem: false
//        focus: true
//    }
//    Component{
//        id: highlightComponent
//        Item{
//            width: ListView.view.width
//            height: ListView.view.currentItem.height
//            y: ListView.view.currentItem.y
//            Behavior on y{
//                SequentialAnimation{
//                    PropertyAnimation{ target: highlightRectangle; property: "opacity"; to: 0; duration: 200; }
//                    NumberAnimation{ duration: 1 }
//                    PropertyAnimation{ target: highlightRectangle; property: "opacity"; to: 1; duration: 200; }
//                }
//            }
//            Rectangle{
//                id: highlightRectangle
//                anchors.fill: parent
//                color: "green"
//            }
//        }
//    }
//    Component{
//        id: numberDelegate
//        Item{
//            width: ListView.view.width
//            height: 40
//            Text{
//                anchors.centerIn: parent
//                font.pixelSize: 10
//                text: index
//            }
//        }
//    }
//}


//Rectangle{
//    width: 240
//    height: 300

//    ListView{
//        anchors.fill: parent
//        anchors.margins: 20
//        clip: true
//        model: 40
//        delegate: numberDelegate
//        spacing: 2
//        header: headerComponent
//        footer: footerComponent
//    }
//    Component{
//        id: headerComponent
//        Rectangle{
//            width: ListView.view.width
//            height: 20
//            color: "yellow"
//            Text{
//                anchors.fill: parent
//                text: "Header"
//            }
//        }
//    }
//    Component{
//        id: footerComponent
//        Rectangle{
//            width: ListView.view.width
//            height: 20
//            color: "yellow"
//            Text{
//                anchors.fill: parent
//                text: "Footer"
//            }
//        }
//    }
//    Component{
//        id: numberDelegate
//        Rectangle{
//            width: ListView.view.width
//            height: 20
//            color: "green"
//            Text{
//                anchors.fill: parent
//                text: "Item #" + index
//            }
//        }
//    }
//}


//Rectangle{
//    width: 220
//    height: 300
//    anchors.fill: parent
//    GridView{
//        id: view
//        anchors.fill: parent
//        anchors.margins: 20
//        clip: true
//        model: 100
//        cellWidth: 45
//        cellHeight: 45
//        delegate: numberDelegate
//    }
//    Component{
//        id: numberDelegate
//        Rectangle{
//            id: rect
//            width: 40
//            height: 40
//            color: "green"
//            Text{
//                anchors.horizontalCenter: parent.horizontalCenter
//                anchors.verticalCenter: parent.verticalCenter
//                text: index
//            }
//            MouseArea{
//                anchors.fill: parent
//                onClicked: rect.color = "red"
//            }
//        }
//    }
//}


//Rectangle{
//    anchors.fill: parent
//    gradient: Gradient{
//        GradientStop{ position: 0.0; color: "#dbddde" }
//        GradientStop{ position: 1.0; color: "#5fc9f8" }
//    }

//    ListModel{
//        id: listModel
//        ListElement { number: 0 }
//        ListElement { number: 1 }
//        ListElement { number: 2 }
//        ListElement { number: 3 }
//        ListElement { number: 4 }
//        ListElement { number: 5 }
//        ListElement { number: 6 }
//        ListElement { number: 7 }
//        ListElement { number: 8 }
//        ListElement { number: 9 }
//    }

//    Rectangle{
//        id: addItem
//        height: 40
//        anchors.left: parent.left
//        anchors.right: parent.right
//        anchors.bottom: parent.bottom
//        anchors.margins: 20
//        color: "#53d769"
//        border.color: Qt.lighter(color, 1.1)

//        Text{
//            anchors.centerIn: addItem
//            text: "Add item"

//            MouseArea{
//                anchors.fill: parent
//                //model添加数据，默认发送GridView.onAdd信号
//                onClicked: listModel.append({"number": ++addItem.count})
//            }
//        }
//        property int count: 9
//    }

//    GridView{
//        anchors.fill: parent
//        anchors.margins: 20
//        anchors.bottomMargin: 80
//        clip: true
//        model: listModel
//        cellWidth: 45
//        cellHeight: 45
//        delegate: numberDelegate
//    }

//    Component{
//        id: numberDelegate
//        Rectangle{
//            id: wrapper
//            width: 40
//            height: 40
//            gradient: Gradient{
//                GradientStop{ position: 0.0; color: "#f8306a" }
//                GradientStop{ position: 1.0; color: "#fb5b40" }
//            }

//            Text{
//                anchors.centerIn: parent
//                font.pixelSize: 10
//                text: number
//            }

//            MouseArea{
//                anchors.fill: parent
//                //model删除数据，默认发送GridView.onRemove信号
//                onClicked: listModel.remove(index)
//            }
//            GridView.onRemove: SequentialAnimation{
//                PropertyAction{ target: wrapper; property: "GridView.delayRemove"; value: true; }
//                NumberAnimation{ target: wrapper; property: "scale"; to: 1.5; duration: 150; easing.type: Easing.InOutQuad; }
//                NumberAnimation{ target: wrapper; property: "scale"; to: 0; duration: 250; easing.type: Easing.InOutQuad; }
//                PropertyAction{ target: wrapper; property: "GridView.delayRemove"; value: false; }
//            }

//            GridView.onAdd: SequentialAnimation{
//                NumberAnimation{ target: wrapper; property: "scale"; from: 0; to: 1; duration: 250; easing.type: Easing.InOutQuad; }
//            }
//        }
//    }
//}


////包装器（wrapper）的高度（height）被设置为链表视图（ListView）的高度。
////标签图片被放大并且下移，使图片从小图片的位置移向大图片的位置。
////除了这些之外，两个隐藏项，实际视图（factsView）与关闭按键（closeButton）切换它的opactiy（透明度）显示出来。
////最后设置链表视图（ListView）。设置链表视图包含了设置内容Y坐标（contentsY），这是视图顶部可见的部分代理的Y轴坐标。
////另一个变化是设置视图的交互（interactive）为false。这个操作阻止了视图的移动，用户不再能够通过滚动条切换当前项。
//Item{
//    width: 400; height: 800
////    anchors.fill: parent

//    //background
//    Rectangle{
//        anchors.fill: parent
//        gradient: Gradient{
//            GradientStop{ position: 0; color: "#4a4a4a"; }
//            GradientStop{ position: 1; color: "#2b2b2b"; }
//        }
//    }

//    ListView{
//        id: listView
//        anchors.fill: parent
//        spacing: 2
//        delegate: detailsDelegate
//        model: ListModel{
//            ListElement{ name: "Mercury"; imageSource: "image/pinwheel.png"; facts: "Mercury is the smallest planet in the Solar System. It is the closest planet to the sun. It makes one trip around the Sun once every 87.969 days."; }
//            ListElement{ name: "Venus"; imageSource: "image/1.png"; facts: "Venus is the second planet from the Sun. It is a terrestrial planet because it has a solid, rocky surface. The other terrestrial planets are Mercury, Earth and Mars. Astronomers have known Venus for thousands of years."; }
//            ListElement{ name: "Earth"; imageSource: "image/bg.png"; facts: "The Earth is the third planet from the Sun. It is one of the four terrestrial planets in our Solar System. This means most of its mass is solid. The other three are Mercury, Venus and Mars. The Earth is also called the Blue Planet, 'Planet Earth', and 'Terra'."; }
//            ListElement{ name: "Mars"; imageSource: "image/pole.png"; facts: "Mars is the fourth planet from the Sun in the Solar System. Mars is dry, rocky and cold. It is home to the largest volcano in the Solar System. Mars is named after the mythological Roman god of war because it is a red planet, which signifies the colour of blood."; }
//        }
//    }

//    Component{
//        id: detailsDelegate
//        Rectangle{
//            id: wrapper
//            width: listView.width
//            height: 30
//            color: "black"
//            Text{
//                id: itemTitle
//                height: 30; width: listView.width;
//                color: "white"
//                font.pixelSize: height - 4
//                text: name
//            }

//            Image{
//                id: itemImage
//                width: 26; height: width;
//                anchors.right: parent.right
//                anchors.top: parent.top
//                anchors.rightMargin: 2
//                anchors.topMargin: 2
//                source: imageSource
//            }

//            MouseArea{
//                anchors.fill: itemTitle
//                onClicked: parent.state = parent.state == "expanded" ? "" : "expanded"
//            }

//            Rectangle{
//                id: itemDesc
//                anchors.top: itemImage.bottom
//                anchors { left: parent.left; right: parent.right; bottom: parent.bottom; }
//                opacity: 0
//                    color: "yellow"
//                    border.width: 2
//                    Text{
//                        anchors.fill: parent
//                        anchors.margins: 5
//                        color: "#1f1f21"
//                        font.pixelSize: 12
//                        text: facts
//                        wrapMode: Text.WordWrap
//                        clip: true
//                    }
//            }

//            states: [
//                State{
//                    name: "expanded"
//                    PropertyChanges{ target:wrapper; height:listView.height;}
//                    PropertyChanges{ target:itemImage; width: listView.width; height:listView.width; anchors.rightMargin: 0; anchors.topMargin: 30; }
//                    PropertyChanges{ target:itemDesc; opacity:1; }
//                    PropertyChanges{ target:wrapper.ListView.view; contentY:wrapper.y; interactive: false; }
//                }
//            ]
//            transitions:[
//                Transition{
//                    NumberAnimation{
//                        duration: 400
//                        properties: "height,width,anchors.rightMargin,anchors.topMargin,opacity,contentY"
//                    }
//                }
//            ]
//        }
//    }
//}






//Item	{
//    width:	300
//    height:	480
//    ListView	{
//        id:	listView
//        anchors.fill:	parent
//        delegate:	detailsDelegate
//        model:	planets
//    }
//    ListModel{
//        id: planets
//        ListElement{ name: "Mercury"; imageSource: "image/pinwheel.png"; facts: "Mercury is the smallest planet in the Solar System. It is the closest planet to the sun. It makes one trip around the Sun once every 87.969 days."; }
//        ListElement{ name: "Venus"; imageSource: "image/pinwheel.png"; facts: "Venus is the second planet from the Sun. It is a terrestrial planet because it has a solid, rocky surface. The other terrestrial planets are Mercury, Earth and Mars. Astronomers have known Venus for thousands of years."; }
//        ListElement{ name: "Earth"; imageSource: "image/pinwheel.png"; facts: "The Earth is the third planet from the Sun. It is one of the four terrestrial planets in our Solar System. This means most of its mass is solid. The other three are Mercury, Venus and Mars. The Earth is also called the Blue Planet, 'Planet Earth', and 'Terra'."; }
//        ListElement{ name: "Mars"; imageSource: "image/pinwheel.png"; facts: "Mars is the fourth planet from the Sun in the Solar System. Mars is dry, rocky and cold. It is home to the largest volcano in the Solar System. Mars is named after the mythological Roman god of war because it is a red planet, which signifies the colour of blood."; }
//    }
//    Component	{
//        id:	detailsDelegate
//        Item	{
//            id:	wrapper
//            width:	listView.width
//            height:	30
//            Rectangle	{
//                anchors.left:	parent.left
//                anchors.right:	parent.right
//                anchors.top:	parent.top
//                height:	30
//                color:	"#ffaa00"
//                Text	{
//                    anchors.left:	parent.left
//                    anchors.verticalCenter:	parent.verticalCenter
//                    font.pixelSize:	parent.height-4
//                    text:	name
//                }
//            }
//            Rectangle	{
//                id:	image
//                color:	"black"
//                anchors.right:	parent.right
//                anchors.top:	parent.top
//                anchors.rightMargin:	2
//                anchors.topMargin:	2
//                width:	26
//                height:	26
//                Image	{
//                    anchors.fill:	parent
//                    fillMode:	Image.PreserveAspectFit
//                    source:	imageSource
//                }
//            }
//            MouseArea	{
//                anchors.fill:	parent
//                onClicked:	parent.state	=	"expanded"
//            }
//            Item	{
//                id:	factsView
//                anchors.top:	image.bottom
//                anchors.left:	parent.left
//                anchors.right:	parent.right
//                anchors.bottom:	parent.bottom
//                opacity:	0
//                Rectangle	{
//                    anchors.fill:	parent
//                    color:	"#cccccc"
//                    Text	{
//                        anchors.fill:	parent
//                        anchors.margins:	5
//                        clip:	true
//                        wrapMode:	Text.WordWrap
//                        font.pixelSize:	12
//                        text:	facts
//                    }
//                }
//            }
//            Rectangle	{
//                id:	closeButton
//                anchors.right:	parent.right
//                anchors.top:	parent.top
//                anchors.rightMargin:	2
//                anchors.topMargin:	2
//                width:	26
//                height:	26
//                color:	"red"
//                opacity:	0
//                MouseArea	{
//                    anchors.fill:	parent
//                    onClicked:	wrapper.state	=	""
//                }
//            }
//            states:	[
//                State{
//                    name: "expanded"
//                    PropertyChanges{ target:wrapper; height:listView.height;}
//                    PropertyChanges{ target:image; width: listView.width; height:listView.height; anchors.rightMargin: 0; anchors.topMargin: 30; }
//                    PropertyChanges{ target:factsView; opacity:1; }
//                    PropertyChanges{ target:closeButton; opacity:1; }
//                    PropertyChanges{ target:wrapper.ListView.view; contentY:wrapper.y; interactive: false; }
//                }
//            ]
//            transitions:	[
//                Transition	{
//                    NumberAnimation	{
//                        duration:	200;
//                        //                                                                                    properties:	"height,width,anchors.rightMar
//                        properties: "height,width,anchors.rightMargin,anchors.topMargin,opacity,contentY"
//                    }
//                }
//            ]
//        }
//    }
//}




////这个代码写的有够乱 没看
//    PathView{
//        anchors.fill: parent
//        delegate: flipCardDelegate
//        model: 100
//        path: Path{
//            startX: window.width / 2
//            startY: 0
//            PathAttribute { name: "itemZ"; value: 0 }
//            PathAttribute { name: "itemAngle"; value: -90.0; }
//            PathAttribute { name: "itemScale"; value: 0.5; }
//            PathLine { x: window.width/2; y: window.height*0.4; }
//            PathPercent { value: 0.48; }
//            PathLine { x: window.width/2; y: window.height*0.5; }
//            PathAttribute { name: "itemAngle"; value: 0.0; }
//            PathAttribute { name: "itemScale"; value: 1.0; }
//            PathAttribute { name: "itemZ"; value: 100 }
//            PathLine { x: window.width/2; y: window.height*0.6; }
//            PathPercent { value: 0.52; }
//            PathLine { x: window.width/2; y: window.height; }
//            PathAttribute { name: "itemAngle"; value: 90.0; }
//            PathAttribute { name: "itemScale"; value: 0.5; }
//            PathAttribute { name: "itemZ"; value: 0 }
//        }
//        pathItemCount: 16
//        preferredHighlightBegin: 0.5
//        preferredHighlightEnd: 0.5
//    }

//    Component{
//        id: flipCardDelegate
//        Rectangle{
//            id: wrapper
//            width: 64
//            height: 64
//            color: "blue"
//            antialiasing: true
//            gradient: Gradient{
//                GradientStop { position: 0.0; color: "#2ed5fa" }
//                GradientStop { position: 1.0; color: "#2467ec" }
//            }
//            visible: PathView.onPath
//            scale: PathView.itemScale
//            z: PathView.itemZ
//            property variant rotX: PathView.itemAngle
//            transform: Rotation{
//                axis{ x: 1; y : 0; z: 0; }
//                angle: wrapper.rotX;
//                origin{ x: 32; y: 32; }
//            }
//            Text{
//                anchors.centerIn: parent
//                text: index
//            }
//        }
//    }


//XML模型 没看
//    Item{
//        width: 300
//        height: 480
//        Component{
//            id: imageDelegate
//            Rectangle{
//                width: listView.width
//                height: 220
//                color: "#333"
//                Column{
//                    Text{
//                        text: title
//                        color: "#e0e0e0"
//                    }
//                    Image{
//                        width: listView.width
//                        height: 200
//                        fillMode: Image.PreserveAspectCrop
//                        source: imageSource
//                    }
//                }
//            }
//        }

//        XmlListModel{
//            id: imageModel
//            source: "http://feeds.nationalgeographic.com/ng/photography/photo-of-the-day/"
//            query: "/rss/channel/item"
//            XmlRole{ name: "title"; query: "title/string()"; }
//            XmlRole{ name: "imageSource"; query: "substring-before(substring-after(description/string(), 'img src=\"'), '\"')" }
//        }

//        ListView{
//            id: listView
//            anchors.fill: parent
//            model: imageModel
//            delegate: imageDelegate
//        }
//    }


//Rectangle{
//    width: 300
//    height: 290
//    anchors.fill: parent
//    ListView{
//        anchors.fill: parent
//        anchors.margins: 20
//        clip: true
//        model: spaceMen
//        delegate: spaceManDelegate
//        section.property: "nation"
//        section.delegate: sectionDelegate
//    }
//    Component{
//        id: spaceManDelegate
//        Item{
//            width: ListView.view.width
//            height: 20
//            Text{
//                anchors.left: parent.left
//                anchors.verticalCenter: parent.verticalCenter
//                anchors.leftMargin: 8
//                font.pixelSize: 12
//                text: name
//                color: "#1f1f1f"
//            }
//        }
//    }
//    Component{
//        id: sectionDelegate
//        Rectangle{
//            width: ListView.view.width
//            height: 20
//            Text{
//                anchors.fill: parent
//                color: "#e0e0e0"
//                text: section
//            }
//        }
//    }
//    ListModel{
//        id: spaceMen
//        ListElement { name: "Abdul Ahad Mohmand"; nation: "Afganistan"; }
//        ListElement { name: "Marcos Pontes"; nation: "Brazil"; }
//        ListElement { name: "Alexandar Panayotov Alexandrov"; nation: "Bulgaria"; }
//        ListElement { name: "Georgi Ivanov"; nation: "Bulgaria"; }
//        ListElement { name: "Roberta Bondar"; nation: "Canada"; }
//        ListElement { name: "Marc Garneau"; nation: "Canada"; }
//        ListElement { name: "Chris Hadfield"; nation: "Canada"; }
//        ListElement { name: "Guy Laliberte"; nation: "Canada"; }
//        ListElement { name: "Steven MacLean"; nation: "Canada"; }
//        ListElement { name: "Julie Payette"; nation: "Canada"; }
//        ListElement { name: "Robert Thirsk"; nation: "Canada"; }
//        ListElement { name: "Bjarni Tryggvason"; nation: "Canada"; }
//        ListElement { name: "Dafydd Williams"; nation: "Canada"; }
//    }
//}


//Canvas{
//    id: root
//    width: 200; height: 200
//    onPaint:{
//        var ctx = getContext("2d")
//        ctx.lineWidth = 4
//        ctx.strokeStyle = "blue"
//        ctx.fillStyle = "steelblue"

//        ctx.beginPath()
//        ctx.moveTo(50, 50)
//        ctx.lineTo(150, 50)
//        ctx.lineTo(150, 150)
//        ctx.lineTo(50, 150)

//        ctx.closePath()
//        ctx.fill()
//        ctx.stroke()
//    }
//}


//Canvas{
//    id: root
//    width: 120; height: 120
//    onPaint: {
//        var ctx = getContext("2d")
//        ctx.fillStyle = "green"
//        ctx.strokeStyle = "blue"
//        ctx.lineWidth = 4
//        ctx.fillRect(20, 20, 80, 80)    //后面两个参数是长度，不是坐标。下面两个函数类似
//        ctx.clearRect(30, 30, 60, 60)
//        ctx.strokeRect(20, 20, 40, 40)
//    }
//}


//Canvas{
//    id: root
//    width: 120; height: 120;
//    onPaint:{
//        var ctx = getContext("2d")
//        var gradient = ctx.createLinearGradient(100, 0, 100, 200)
//        gradient.addColorStop(0, "blue")
//        gradient.addColorStop(0.5, "lightsteelblue")
//        ctx.fillStyle = gradient
//        ctx.fillRect(50, 50, 100, 100)
//    }
//}


////未完成，第七章基本没怎么看
//Canvas{
//    id: root
//    width: 120; height: 120;
//    onPaint:{
//        var ctx = getContext("2d")
////        ctx.strokeStyle = "#333"
////        ctx.fillRect(0, 0, root.width, root.height)
////        ctx.shadowColor = "@2ed5fa"
////        ctx.shadowOffsetX = 2;
////        ctx.shadowOffsetY = 2
////        ctx.shadowBlur = 10;
//////        ctx.font = "bold 80px Ubuntu"
////        ctx.fillStyle = "#24d12e"
////        ctx.fillText("Canvas!", 30, 180)

//        ctx.strokeStyle = "#333"
//                ctx.fillRect(0,0,root.width,root.height);

//        ctx.shadowColor = "#2ed5fa";
//                ctx.shadowOffsetX = 2;
//                ctx.shadowOffsetY = 2;
//                ctx.shadowBlur = 10;

//        ctx.font = 'bold 80px';
//                ctx.fillStyle = "#24d12e";
//                ctx.fillText("Canvas!",30,180);
//    }
//}


////未完成
//Canvas{
//    id: root
//    width: 500; height: 500;
//    onPaint:{
//        var ctx = getContext("2d")


//                // draw an image
//                ctx.drawImage('image/bg.png', 10, 10)

//                // store current context setup
//                ctx.save()
//                ctx.strokeStyle = '#ff2a68'
//                // create a triangle as clip region
//                ctx.beginPath()
//                ctx.moveTo(110,10)
//                ctx.lineTo(155,10)
//                ctx.lineTo(135,55)
//                ctx.closePath()
//                // translate coordinate system
//                ctx.clip()  // create clip from the path
//                // draw image with clip applied
//                ctx.drawImage('assets/bg.png', 100, 10)
//                // draw stroke around path
//                ctx.stroke()
//                // restore previous context
//                ctx.restore()
//    }

//    Component.onCompleted:{
//        loadImage("image/pinwheel.png")
//    }
//}


//Rectangle {
//    id: root
//    width: 480; height: 480
//    color: "#1f1f1f"

//    //In the heart of the particle simulation is the ParticleSystem which controls the shared time-line.
//    ParticleSystem {    //h binds all elements to an simulation
//        id: particleSystem
//    }

//    //emits particles into the system
//    Emitter {
//        id: emitter
////        anchors.centerIn: parent
////        anchors.left: parent.left
//        anchors.verticalCenter: parent.verticalCenter
//        width: 100; height: 100
//        system: particleSystem
//        emitRate: 100
//        lifeSpan: 6000
//        lifeSpanVariation: 500
//        size: Math.random() * 20
//        endSize: Math.random() * 160
////        Tracer { color: 'green' }
//        velocity: AngleDirection {
//            angle: -45
//            angleVariation: 0
//            magnitude: 100
//        }
//        acceleration: AngleDirection {
//            angle: 90
//            magnitude: 25
//        }
//    }

////    Emitter {
////           id: emitter
////           anchors.left: parent.left
////           anchors.verticalCenter: parent.verticalCenter
////           width: 1; height: 1
////           system: particleSystem
////           emitRate: 10
////           lifeSpan: 6400
////           lifeSpanVariation: 400
////           size: 32
////           velocity: AngleDirection {
////               angle: -45
////               angleVariation: 0
////               magnitude: 100
////           }
////           acceleration: AngleDirection {
////               angle: 90
////               magnitude: 25
////           }
////       }

//    ImageParticle {
//        source: "image/pinwheel.png"
//        system: particleSystem
//        color: "#ffd700"
//        colorVariation: 0.3
//        rotation: 15        //start by 15 degrees clockwise
//        rotationVariation: 5    // +/-5 degrees
//        rotationVelocity: 45    //45 degrees per second
//        rotationVelocityVariation: 15   // +/- 15 degrees per second
//        entryEffect: ImageParticle.Scale
//    }
//}
////第八章到这就没看


import QtQuick 2.5
import QtGraphicalEffects 1.0

Rectangle {
    width: 480; height: 240
    color: '#1e1e1e'

    Row {
        anchors.centerIn: parent
        spacing: 16

        Image {
            id: sourceImage
            source: "image/1.png"
            width: 200; height: width
            sourceSize: Qt.size(parent.width, parent.height)
            smooth: true
        }

        FastBlur {
            width: 200; height: width
            source: sourceImage
            radius: blurred?32:0
            property bool blurred: false

            Behavior on radius {
                NumberAnimation { duration: 1000 }
            }

            MouseArea {
                id: area
                anchors.fill: parent
                onClicked: parent.blurred = !parent.blurred
            }
        }
    }
}



















