# VOICE TO CONVERSATION FORMAT(OFFLINE MODE)


This project is a real-time Speaker Diarization and Speech Transcription mobile application developed using Flutter, TensorFlow Lite, and audio processing tools. It distinguishes between different speakers and transcribes conversations with speaker labels and timestamps.

## Overview

The application captures audio from the microphone, extracts speaker embeddings using a pre-trained TensorFlow Lite model, and applies a clustering algorithm (DBSCAN) to assign speaker identities. Simultaneously, it performs speech-to-text conversion to generate transcriptions and displays them in a structured conversational format.

## Features

- Real-time audio capture and processing
- Offline speaker embedding extraction using TensorFlow Lite
- Speaker clustering with DBSCAN
- Live transcription using the `speech_to_text` package
- Display of conversations with speaker ID and timestamp
- Built-in UI to start/stop recordings and view speaker-labeled dialogue

## System Requirements

- Flutter SDK (3.x or higher)
- Android Studio or Visual Studio Code with Flutter plugin
- Mobile device or emulator with microphone support
