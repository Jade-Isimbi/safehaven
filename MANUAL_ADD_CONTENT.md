# How to Add Educational Content to Firestore

## Option 1: Manual Addition via Firebase Console

### Step 1: Access Firebase Console
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your SafeHaven project
3. Navigate to **Firestore Database** in the left sidebar

### Step 2: Create Documents in educationalContent Collection
1. Click on the **educationalContent** collection
2. Click **"Add document"**
3. Use the following structure for each document:

#### Document 1: Signs of GBV
```
title: "Signs of Gender-Based Violence"
description: "Learn to recognize the warning signs of GBV in relationships and communities. Understanding these signs can help you identify when someone needs support."
content: "Gender-Based Violence (GBV) manifests in various forms, and recognizing the signs is crucial for early intervention and support. Here are the key categories of signs:

PHYSICAL SIGNS:
• Unexplained injuries, bruises, or marks
• Frequent visits to healthcare providers
• Wearing clothing that covers injuries
• Changes in physical appearance or hygiene

EMOTIONAL SIGNS:
• Depression, anxiety, or mood swings
• Low self-esteem or self-worth
• Isolation from friends and family
• Fearful behavior around certain people
• Emotional manipulation or gaslighting

SOCIAL SIGNS:
• Withdrawal from social activities
• Changes in relationships with friends/family
• Financial control or restrictions
• Monitoring of phone, social media, or movements
• Threats or intimidation

DIGITAL SIGNS:
• Cyberstalking or online harassment
• Unwanted sharing of intimate images
• Control over online accounts
• Monitoring of digital communications

If you notice these signs in yourself or someone you know, remember that help is available. You are not alone, and support services are ready to assist you."
language: "English"
```

#### Document 2: Types of GBV
```
title: "Types of Gender-Based Violence"
description: "Explore the different forms of GBV and understand how they impact individuals and communities. Knowledge is power in prevention and support."
content: "Gender-Based Violence encompasses various forms of violence that disproportionately affect individuals based on their gender. Understanding these types helps in prevention and support:

PHYSICAL VIOLENCE:
• Domestic violence and intimate partner violence
• Sexual assault and rape
• Female genital mutilation (FGM)
• Honor killings
• Human trafficking for sexual exploitation

PSYCHOLOGICAL VIOLENCE:
• Emotional abuse and manipulation
• Verbal abuse and threats
• Gaslighting and psychological control
• Stalking and harassment
• Economic abuse and financial control

SEXUAL VIOLENCE:
• Rape and sexual assault
• Sexual harassment in workplace/schools
• Child sexual abuse
• Forced prostitution
• Sexual exploitation online

ECONOMIC VIOLENCE:
• Financial control and restrictions
• Preventing access to education or employment
• Forced economic dependency
• Property and inheritance discrimination

DIGITAL VIOLENCE:
• Cyberstalking and online harassment
• Non-consensual sharing of intimate images
• Digital surveillance and control
• Online threats and intimidation

INSTITUTIONAL VIOLENCE:
• Discriminatory laws and policies
• Gender-based discrimination in healthcare
• Educational barriers
• Workplace discrimination and harassment

Each type of GBV has unique impacts and requires specific approaches for prevention, intervention, and support. Recognizing these forms is the first step toward creating safer communities."
language: "English"
```

#### Document 3: Impact of GBV
```
title: "Impact of Gender-Based Violence"
description: "Understand the far-reaching effects of GBV on individuals, families, and communities. Learn about the physical, emotional, and social consequences."
content: "Gender-Based Violence has profound and lasting impacts that extend beyond immediate physical harm. Understanding these effects is crucial for providing appropriate support:

PHYSICAL IMPACTS:
• Acute injuries and chronic health problems
• Reproductive health issues
• Increased risk of STIs and unwanted pregnancies
• Sleep disorders and eating problems
• Substance abuse as coping mechanism

MENTAL HEALTH IMPACTS:
• Post-traumatic stress disorder (PTSD)
• Depression and anxiety disorders
• Suicidal thoughts and attempts
• Dissociation and memory problems
• Complex trauma and attachment issues

SOCIAL IMPACTS:
• Isolation from support networks
• Loss of employment or educational opportunities
• Housing instability and homelessness
• Stigma and discrimination
• Intergenerational trauma

ECONOMIC IMPACTS:
• Loss of income and financial independence
• Medical and legal expenses
• Reduced productivity and career advancement
• Economic dependency on abusers
• Poverty and economic insecurity

COMMUNITY IMPACTS:
• Breakdown of social cohesion
• Increased healthcare and social service costs
• Reduced community safety and trust
• Normalization of violence
• Intergenerational cycles of abuse

LONG-TERM EFFECTS:
• Chronic health conditions
• Relationship difficulties
• Parenting challenges
• Trust and intimacy issues
• Ongoing safety concerns

Understanding these impacts helps survivors, supporters, and professionals provide more effective assistance and work toward prevention and healing."
language: "English"
```

#### Document 4: Supporting Survivors
```
title: "How to Support GBV Survivors"
description: "Learn practical ways to support survivors of gender-based violence. Your support can make a crucial difference in someone's healing journey."
content: "Supporting survivors of Gender-Based Violence requires sensitivity, patience, and understanding. Here are essential guidelines for providing effective support:

IMMEDIATE SUPPORT:
• Believe the survivor without judgment
• Listen actively and validate their feelings
• Respect their decisions and autonomy
• Ensure their safety and confidentiality
• Provide information about available resources

EMOTIONAL SUPPORT:
• Offer empathy without pity
• Avoid blaming or questioning their choices
• Respect their healing timeline
• Be patient with their emotional responses
• Encourage professional help when appropriate

PRACTICAL SUPPORT:
• Help them access emergency services if needed
• Assist with finding safe housing options
• Support them in accessing legal resources
• Help with childcare or transportation
• Accompany them to appointments if requested

SAFETY PLANNING:
• Help develop safety plans
• Identify emergency contacts
• Plan escape routes and safe places
• Document incidents and evidence
• Know local emergency numbers

BOUNDARIES AND SELF-CARE:
• Set healthy boundaries for yourself
• Practice self-care to avoid burnout
• Seek support for your own emotional needs
• Know your limits and when to refer to professionals
• Maintain confidentiality and trust

RESOURCES TO SHARE:
• Local domestic violence shelters
• Crisis hotlines and helplines
• Legal aid services
• Mental health professionals
• Support groups and counseling services

Remember: Supporting survivors is a marathon, not a sprint. Your consistent, non-judgmental presence can be a powerful source of healing and hope."
language: "English"
```

#### Document 5: Legal Rights
```
title: "Legal Rights for GBV Survivors"
description: "Understand your legal rights and protections as a survivor of gender-based violence. Knowledge of your rights is essential for seeking justice and protection."
content: "Survivors of Gender-Based Violence have important legal rights and protections. Understanding these rights is crucial for seeking justice and safety:

BASIC LEGAL RIGHTS:
• Right to safety and protection from further harm
• Right to report violence to law enforcement
• Right to legal representation and advocacy
• Right to privacy and confidentiality
• Right to access support services

PROTECTION ORDERS:
• Restraining orders and protection orders
• Emergency protection orders
• Long-term protection orders
• Violation consequences and enforcement
• How to apply and renew orders

CRIMINAL JUSTICE PROCESS:
• Reporting to police and investigation process
• Victim rights during criminal proceedings
• Witness protection and safety measures
• Court accompaniment and support
• Sentencing and offender accountability

CIVIL LEGAL OPTIONS:
• Civil lawsuits for damages
• Family law proceedings (divorce, custody)
• Immigration protections for survivors
• Employment discrimination claims
• Housing rights and protections

VICTIM COMPENSATION:
• Crime victim compensation programs
• Medical and counseling expense coverage
• Lost wages and relocation assistance
• Funeral expenses for fatal cases
• Application process and requirements

INTERNATIONAL PROTECTIONS:
• Refugee and asylum protections
• International human rights frameworks
• Cross-border protection orders
• International criminal justice options
• UN and NGO support resources

KNOWING YOUR RIGHTS:
• Document everything related to the violence
• Keep copies of all legal documents
• Maintain a safety plan and emergency contacts
• Know local and national resources
• Seek legal advice from qualified professionals

Remember: You have the right to safety, justice, and support. Legal systems can be complex, but help is available to navigate these processes."
language: "English"
```

#### Document 6: Healing Journey
```
title: "The Healing Journey After GBV"
description: "Explore the path to healing and recovery after experiencing gender-based violence. Every survivor's journey is unique, but support and hope are available."
content: "Healing from Gender-Based Violence is a deeply personal journey that takes time, patience, and support. While every survivor's path is unique, understanding the healing process can help guide recovery:

UNDERSTANDING THE HEALING PROCESS:
• Healing is not linear - progress and setbacks are normal
• Everyone heals at their own pace
• There's no 'right' way to heal
• Healing involves both emotional and physical recovery
• Professional support can accelerate healing

EMOTIONAL HEALING:
• Processing trauma and its impact
• Rebuilding self-esteem and self-worth
• Learning to trust again (including yourself)
• Managing triggers and flashbacks
• Developing healthy coping mechanisms

PHYSICAL HEALING:
• Addressing physical injuries and health issues
• Reconnecting with your body safely
• Managing stress and sleep problems
• Building physical strength and confidence
• Seeking appropriate medical care

RELATIONSHIP HEALING:
• Rebuilding trust in relationships
• Setting healthy boundaries
• Learning to communicate needs
• Developing supportive relationships
• Addressing intimacy and connection

SPIRITUAL AND PERSONAL GROWTH:
• Finding meaning and purpose
• Reconnecting with your values
• Building resilience and strength
• Discovering new interests and passions
• Developing a positive self-narrative

HEALING TOOLS AND TECHNIQUES:
• Therapy and counseling
• Support groups and peer support
• Mindfulness and meditation
• Creative expression (art, writing, music)
• Physical activity and movement
• Journaling and self-reflection

SETBACKS AND CHALLENGES:
• Triggers and flashbacks
• Anniversary reactions
• Legal and practical challenges
• Relationship difficulties
• Mental health fluctuations

CELEBRATING PROGRESS:
• Acknowledging small victories
• Building confidence and self-trust
• Creating new positive experiences
• Helping others in their healing
• Finding joy and meaning in life

Remember: Healing is possible, and you deserve support, love, and care throughout your journey. You are stronger than what happened to you."
language: "English"
```

### Step 3: Test Your App
1. Run your Flutter app: `flutter run`
2. Navigate to the "Understanding GBV" section
3. You should now see the educational content displayed in beautiful cards
4. Tap on any card to view the detailed content

## Option 2: Using the Script (Advanced)

If you prefer to use the automated script:

1. Install Node.js if you haven't already
2. Install Firebase Admin SDK: `npm install firebase-admin`
3. Download your service account key from Firebase Console
4. Update the path in `add_educational_content.js`
5. Run: `node add_educational_content.js`

## Content Structure

Each document in the `educationalContent` collection should have these fields:
- `title` (string): The title of the educational content
- `description` (string): A brief description for the list view
- `content` (string): The full educational content
- `language` (string): The language of the content (e.g., "English")

## Notes

- The content is designed to be educational and supportive
- All content is written in a sensitive, trauma-informed manner
- The content covers various aspects of GBV awareness and support
- You can modify the content to better fit your specific needs
- Consider adding content in multiple languages for broader accessibility 