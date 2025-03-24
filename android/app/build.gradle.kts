import java.util.Properties
import java.util.regex.Matcher
import java.util.regex.Pattern

fun loadPropertiesFile(fileName: String): Properties {
    println(fileName)
    val properties = Properties()
    val propertiesFile = rootProject.file(fileName)
    if (propertiesFile.exists()) {
        propertiesFile.bufferedReader(Charsets.UTF_8).use { reader ->
            properties.load(reader)
        }
    }
    return properties
}

val localProperties = loadPropertiesFile("local.properties")
val keystoreProperties = loadPropertiesFile("key.properties")

val flutterRoot: String = localProperties.getProperty("flutter.sdk")
    ?: throw GradleException("Flutter SDK not found. Define location with flutter.sdk in the local.properties file.")

val flutterVersionCode: String = localProperties.getProperty("flutter.versionCode") ?: "1"
val flutterVersionName: String = localProperties.getProperty("flutter.versionName") ?: "1.0"

fun getCurrentFlavor(): String {
    val gradle = gradle
    val tskReqStr = gradle.startParameter.taskRequests.toString()

    println(tskReqStr)
    val pattern: Pattern = when {
        tskReqStr.contains("assemble") -> Pattern.compile("assemble(\\w+)(Release|Debug)")
        tskReqStr.contains("bundle") -> Pattern.compile("bundle(\\w+)(Release|Debug)")
        else -> Pattern.compile("generate(\\w+)(Release|Debug)")
    }

    val matcher: Matcher = pattern.matcher(tskReqStr)
    return if (matcher.find()) {
        matcher.group(1).lowercase()
    } else {
        println("NO MATCH FOUND")
        ""
    }
}

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.getx_structure_template"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.getx_structure_template"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        debug {
            signingConfig = signingConfigs.getByName("debug")
        }
    }

//    signingConfigs {
//        create("release") {
//            keyAlias = keystoreProperties["keyAlias"] as String?
//            keyPassword = keystoreProperties["password"] as String?
//            storeFile = keystoreProperties["storeFile"]?.let { file(it) }
//            storePassword = keystoreProperties["password"] as String?
//        }
//    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    flavorDimensions = "default"
    productFlavors {
        create("dev") {
            dimension = "default"
            applicationIdSuffix = ".dev"
        }
        create("prod") {
            dimension = "default"
        }
    }
}

flutter {
    source = "../.."
    target = "lib/main_${getCurrentFlavor()}.dart"
}
