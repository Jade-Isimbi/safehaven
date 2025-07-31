const admin = require('firebase-admin');
const fs = require('fs');

// Initialize Firebase Admin SDK
// You'll need to replace this with your actual service account key
// Download your service account key from Firebase Console > Project Settings > Service Accounts
const serviceAccount = require('./path-to-your-service-account-key.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();

// Read the sample content
const sampleContent = JSON.parse(fs.readFileSync('./sample_educational_content.json', 'utf8'));

async function addEducationalContent() {
  try {
    console.log('Starting to add educational content to Firestore...');
    
    for (const content of sampleContent.educationalContent) {
      // Remove the id from the data object since Firestore will generate it
      const { id, ...contentData } = content;
      
      // Add the document to the educationalContent collection
      const docRef = await db.collection('educationalContent').add({
        title: contentData.title,
        description: contentData.description,
        content: contentData.content,
        language: contentData.language,
        createdAt: admin.firestore.FieldValue.serverTimestamp()
      });
      
      console.log(`✅ Added: ${contentData.title} (ID: ${docRef.id})`);
    }
    
    console.log('\n🎉 Successfully added all educational content to Firestore!');
    console.log('You can now view this content in your SafeHaven app.');
    
  } catch (error) {
    console.error('❌ Error adding educational content:', error);
  } finally {
    process.exit(0);
  }
}

// Run the function
addEducationalContent(); 