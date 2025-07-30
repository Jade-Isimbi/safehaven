const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp();

exports.processRightsContent = functions.firestore
  .document('rightsContent/{docId}')
  .onCreate((snap, context) => {
    const data = snap.data();
    
    // If content contains a URL, extract it to a separate field
    if (data.content && (data.content.includes('http://') || data.content.includes('https://'))) {
      const urlMatch = data.content.match(/(https?:\/\/[^\s]+)/);
      if (urlMatch) {
        const url = urlMatch[0];
        const contentWithoutUrl = data.content.replace(url, '').trim();
        
        return snap.ref.update({
          url: url,
          content: contentWithoutUrl,
          hasUrl: true
        });
      }
    }
    
    return null;
  }); 