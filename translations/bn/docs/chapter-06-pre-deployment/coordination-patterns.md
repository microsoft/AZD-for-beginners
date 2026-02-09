# মাল্টি-এজেন্ট সমন্বয় প্যাটার্ন

⏱️ **অনুমানিত সময়**: 60-75 minutes | 💰 **আনুমানিক খরচ**: ~$100-300/month | ⭐ **জটিলতা**: Advanced

**📚 শিখনের পথ:**
- ← পূর্ববর্তী: [ক্যাপাসিটি পরিকল্পনা](capacity-planning.md) - রিসোর্স সাইজিং এবং স্কেলিং কৌশল
- 🎯 **আপনি এখানে আছেন**: মাল্টি-এজেন্ট সমন্বয় প্যাটার্ন (অর্কেস্ট্রেশন, যোগাযোগ, স্টেট ম্যানেজমেন্ট)
- → পরবর্তী: [SKU নির্বাচন](sku-selection.md) - সঠিক Azure পরিষেবা নির্বাচন
- 🏠 [কোর্স হোম](../../README.md)

---

## আপনি যা শিখবেন

এই পাঠ সম্পূর্ণ করলে, আপনি:
- বুঝতে পারবেন **মাল্টি-এজেন্ট আর্কিটেকচার** প্যাটার্ন এবং কখন এগুলি ব্যবহার করবেন
- প্রয়োগ করতে পারবেন **অর্কেস্ট্রেশন প্যাটার্ন** (কেন্দ্রীকৃত, বিকেন্দ্রীকৃত, বহুস্তরীয়)
- ডিজাইন করতে পারবেন **এজেন্ট যোগাযোগ** কৌশল (সিঙ্ক্রোনাস, অ্যাসিঙ্ক্রোনাস, ইভেন্ট-চালিত)
- পরিচালনা করবেন বিতরণকৃত এজেন্টদের মধ্যে **শেয়ার্ড স্টেট**
- ডেপ্লয় করবেন Azure-এ AZD ব্যবহার করে **মাল্টি-এজেন্ট সিস্টেম**
- বাস্তব-জগতের AI পরিস্থিতিতে **সমন্বয় প্যাটার্ন** প্রয়োগ করবেন
- মনিটর এবং ডিবাগ করবেন বিতরণকৃত এজেন্ট সিস্টেম

## কেন মাল্টি-এজেন্ট সমন্বয় গুরুত্বপূর্ণ

### বিবর্তন: একক এজেন্ট থেকে মাল্টি-এজেন্ট পর্যন্ত

**একক এজেন্ট (সরল):**
```
User → Agent → Response
```
- ✅ বোঝা ও প্রয়োগ করা সহজ
- ✅ সরল কাজের জন্য দ্রুত
- ❌ একক মডেলের সক্ষমতায় সীমাবদ্ধ
- ❌ জটিল কাজ সমান্তরালে করতে পারে না
- ❌ কোন বিশেষায়ন নেই

**মাল্টি-এজেন্ট সিস্টেম (উন্নত):**
```
           ┌─────────────┐
           │ Orchestrator│
           └──────┬──────┘
        ┌─────────┼─────────┐
        │         │         │
    ┌───▼──┐  ┌──▼───┐  ┌──▼────┐
    │Agent1│  │Agent2│  │Agent3 │
    │(Plan)│  │(Code)│  │(Review)│
    └──────┘  └──────┘  └───────┘
```
- ✅ নির্দিষ্ট কাজের জন্য বিশেষায়িত এজেন্ট
- ✅ গতি বাড়াতে সমান্তরাল কার্যনির্বাহ
- ✅ মডুলার এবং রক্ষণাবেক্ষণযোগ্য
- ✅ জটিল ওয়ার্কফ্লো-এ ভালো
- ⚠️ সমন্বয় লজিক প্রয়োজন

**উপমা**: একক এজেন্ট এক ব্যক্তি যেমন সব কাজই করুক, মাল্টি-এজেন্ট এমন এক দলের মত যেখানে প্রতিটি সদস্যের বিশেষায়িত দক্ষতা থাকে (গবেষক, কোডার, রিভিউয়ার, লেখক) এবং তারা একসাথে কাজ করে।

---

## মূল সমন্বয় প্যাটার্ন

### প্যাটার্ন ১: ধারাবাহিক সমন্বয় (চেইন অফ রেসপনসিবিলিটি)

**কখন ব্যবহার করবেন**: কাজগুলো নির্দিষ্ট ক্রমে সম্পন্ন হতে হবে; প্রতিটি এজেন্ট পূর্ববর্তী আউটপুটের উপর ভিত্তি করে কাজ করে।

```mermaid
sequenceDiagram
    participant User
    participant Orchestrator
    participant Agent1 as গবেষণা এজেন্ট
    participant Agent2 as লেখক এজেন্ট
    participant Agent3 as সম্পাদক এজেন্ট
    
    User->>Orchestrator: "এআই সম্পর্কে নিবন্ধ লিখুন"
    Orchestrator->>Agent1: বিষয় গবেষণা করুন
    Agent1-->>Orchestrator: গবেষণার ফলাফল
    Orchestrator->>Agent2: খসড়া লিখুন (গবেষণা ব্যবহার করে)
    Agent2-->>Orchestrator: খসড়া নিবন্ধ
    Orchestrator->>Agent3: সম্পাদনা ও উন্নত করুন
    Agent3-->>Orchestrator: চূড়ান্ত নিবন্ধ
    Orchestrator-->>User: পরিশোধিত নিবন্ধ
    
    Note over User,Agent3: ক্রমিক: প্রতিটি ধাপ পূর্ববর্তীটির জন্য অপেক্ষা করে
```
**সুবিধাসমূহ:**
- ✅ পরিষ্কার ডেটা প্রবাহ
- ✅ ডিবাগ করা সহজ
- ✅ পূর্বানুমানযোগ্য কার্যনির্বাহ ক্রম

**সীমাবদ্ধতা:**
- ❌ ধীর (কোনো সমান্তরালতা নেই)
- ❌ একটি ব্যর্থতা পুরো চেইনকে ব্লক করে
- ❌ পারস্পরিক নির্ভরশীল কাজগুলো পরিচালনা করতে পারে না

**উদাহরণ ব্যবহার কেস:**
- বিষয়বস্তু তৈরির পাইপলাইন (গবেষণা → লেখা → সম্পাদনা → প্রকাশ)
- কোড জেনারেশন (পরিকল্পনা → বাস্তবায়ন → পরীক্ষা → ডেপ্লয়)
- রিপোর্ট তৈরী (ডেটা সংগ্রহ → বিশ্লেষণ → ভিজ্যুয়ালাইজেশন → সারসংক্ষেপ)

---

### প্যাটার্ন ২: সমান্তরাল সমন্বয় (ফ্যান-আউট/ফ্যান-ইন)

**কখন ব্যবহার করবেন**: স্বাধীন কাজগুলো একসাথে চালানো যায়, ফলাফলগুলো শেষে একত্রিত করা হয়।

```mermaid
graph TB
    User[ব্যবহারকারীর অনুরোধ]
    Orchestrator[অর্কেস্ট্রেটর]
    Agent1[বিশ্লেষণ এজেন্ট]
    Agent2[গবেষণা এজেন্ট]
    Agent3[তথ্য এজেন্ট]
    Aggregator[ফলাফল সংগ্রাহক]
    Response[সমন্বিত উত্তর]
    
    User --> Orchestrator
    Orchestrator --> Agent1
    Orchestrator --> Agent2
    Orchestrator --> Agent3
    Agent1 --> Aggregator
    Agent2 --> Aggregator
    Agent3 --> Aggregator
    Aggregator --> Response
    
    style Orchestrator fill:#2196F3,stroke:#1976D2,stroke-width:3px,color:#fff
    style Aggregator fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
**সুবিধাসমূহ:**
- ✅ দ্রুত (সমান্তরাল কার্যনির্বাহ)
- ✅ ফল্ট-টলারেন্ট (আংশিক ফলাফল গ্রহণযোগ্য)
- ✅ অনুভূমিকভাবে স্কেলযোগ্য

**সীমাবদ্ধতা:**
- ⚠️ ফলাফল ক্রমহীনভাবে পৌঁছাতে পারে
- ⚠️ অ্যাগ্রিগেশন লজিক প্রয়োজন
- ⚠️ জটিল স্টেট ম্যানেজমেন্ট

**উদাহরণ ব্যবহার কেস:**
- একাধিক উৎস থেকে ডেটা সংগ্রহ (APIs + ডাটাবেস + ওয়েব স্ক্র্যাপিং)
- প্রতিযোগিতামূলক বিশ্লেষণ (একাধিক মডেল সমাধান উৎপন্ন করে, সেরা নির্বাচন করা হয়)
- অনুবাদ সার্ভিস (একাধিক ভাষায় একই সঙ্গে অনুবাদ)

---

### প্যাটার্ন ৩: হায়ারার্কিক্যাল সমন্বয় (ম্যানেজার-ওয়ার্কার)

**কখন ব্যবহার করবেন**: সাব-টাস্কযুক্ত জটিল ওয়ার্কফ্লো যেখানে দায়িত্ব দেওয়ার প্রয়োজন।

```mermaid
graph TB
    Master[মাস্টার অর্কেস্ট্রেটর]
    Manager1[গবেষণা ম্যানেজার]
    Manager2[বিষয়বস্তু ম্যানেজার]
    W1[ওয়েব স্ক্র্যাপার]
    W2[পেপার বিশ্লেষক]
    W3[লেখক]
    W4[সম্পাদক]
    
    Master --> Manager1
    Master --> Manager2
    Manager1 --> W1
    Manager1 --> W2
    Manager2 --> W3
    Manager2 --> W4
    
    style Master fill:#FF9800,stroke:#F57C00,stroke-width:3px,color:#fff
    style Manager1 fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style Manager2 fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
```
**সুবিধাসমূহ:**
- ✅ জটিল ওয়ার্কফ্লো পরিচালনা করে
- ✅ মডুলার এবং রক্ষণাবেক্ষণযোগ্য
- ✅ স্পষ্ট দায়িত্ব সীমা

**সীমাবদ্ধতা:**
- ⚠️ আরও জটিল আর্কিটেকচার
- ⚠️ বেশি ল্যাটেন্সি (একাধিক সমন্বয় স্তর)
- ⚠️ জটিল অর্কেস্ট্রেশন প্রয়োজন

**উদাহরণ ব্যবহার কেস:**
- এন্টারপ্রাইজ ডকুমেন্ট প্রসেসিং (শ্রেণীবদ্ধ → রুট → প্রক্রিয়াকরণ → আর্কাইভ)
- বহু-স্তরীয় ডেটা পাইপলাইন (ইনজেস্ট → ক্লিন → ট্রান্সফর্ম → বিশ্লেষণ → রিপোর্ট)
- জটিল অটোমেশন ওয়ার্কফ্লো (পরিকল্পনা → রিসোর্স বরাদ্দ → এক্সিকিউশন → মনিটরিং)

---

### প্যাটার্ন ৪: ইভেন্ট-চালিত সমন্বয় (পাবলিশ-সাবস্ক্রাইব)

**কখন ব্যবহার করবেন**: এজেন্টগুলো ইভেন্টে প্রতিক্রিয়া জানাবে এবং ঢিলা সংযুক্তি (loose coupling) প্রয়োজন হলে।

```mermaid
sequenceDiagram
    participant Agent1 as তথ্য সংগ্রহকারী
    participant EventBus as Azure সার্ভিস বাস
    participant Agent2 as বিশ্লেষক
    participant Agent3 as বিজ্ঞপ্তি প্রেরক
    participant Agent4 as সংরক্ষণকারী
    
    Agent1->>EventBus: প্রকাশ "ডেটা প্রাপ্ত" ইভেন্ট
    EventBus->>Agent2: সাবস্ক্রাইব: তথ্য বিশ্লেষণ
    EventBus->>Agent3: সাবস্ক্রাইব: বিজ্ঞপ্তি পাঠান
    EventBus->>Agent4: সাবস্ক্রাইব: তথ্য সংরক্ষণ
    
    Note over Agent1,Agent4: সব সাবস্ক্রাইবার স্বাধীনভাবে প্রক্রিয়াকরণ করে
    
    Agent2->>EventBus: প্রকাশ "বিশ্লেষণ সম্পন্ন" ইভেন্ট
    EventBus->>Agent3: সাবস্ক্রাইব: বিশ্লেষণ প্রতিবেদন পাঠান
```
**সুবিধাসমূহ:**
- ✅ এজেন্টগুলোর মধ্যে ঢিলা সংযুক্তি
- ✅ নতুন এজেন্ট যোগ করা সহজ (কেবল সাবস্ক্রাইব করলে)
- ✅ অ্যাসিঙ্ক্রোনাস প্রসেসিং
- ✅ প্রতিরোধী (মেসেজ স্থায়িত্ব)

**সীমাবদ্ধতা:**
- ⚠️ শেষপর্যন্ত সামঞ্জস্য
- ⚠️ জটিল ডিবাগিং
- ⚠️ মেসেজ অর্ডারিং চ্যালেঞ্জ

**উদাহরণ ব্যবহার কেস:**
- রিয়েল-টাইম মনিটরিং সিস্টেম (অ্যলার্ট, ড্যাশবোর্ড, লগস)
- বহু-চ্যানেল নোটিফিকেশন (ইমেইল, SMS, পুশ, Slack)
- ডেটা প্রসেসিং পাইপলাইন (একই ডেটার একাধিক কনজিউমার)

---

### প্যাটার্ন ৫: কনসেনসাস-ভিত্তিক সমন্বয় (ভোটিং/কোয়ারাম)

**কখন ব্যবহার করবেন**: এগিয়ে যাওয়ার আগে একাধিক এজেন্টের সম্মতি প্রয়োজন হলে।

```mermaid
graph TB
    Input[ইনপুট কাজ]
    Agent1[এজেন্ট ১: GPT-4]
    Agent2[এজেন্ট ২: Claude]
    Agent3[এজেন্ট ৩: Gemini]
    Voter[সম্মত ভোটার]
    Output[সম্মত আউটপুট]
    
    Input --> Agent1
    Input --> Agent2
    Input --> Agent3
    Agent1 --> Voter
    Agent2 --> Voter
    Agent3 --> Voter
    Voter --> Output
    
    style Voter fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
```
**সুবিধাসমূহ:**
- ✅ উচ্চতর নির্ভুলতা (একাধিক মতামত)
- ✅ ফল্ট-টলারেন্ট (অল্প সংখ্যক ব্যর্থতা গ্রহণযোগ্য)
- ✅ গুণমান নিশ্চিতকরণ অন্তর্নির্মিত

**সীমাবদ্ধতা:**
- ❌ ব্যয়বহুল (একাধিক মডেল কল)
- ❌ ধীর (সমস্ত এজেন্টের অপেক্ষা করতে হয়)
- ⚠️ সংঘাত সমাধান প্রয়োজন

**উদাহরণ ব্যবহার কেস:**
- কনটেন্ট মনিটরিং (একাধিক মডেল কনটেন্ট রিভিউ করে)
- কোড রিভিউ (একাধিক লিন্টার/অ্যানালাইজার)
- মেডিকেল ডায়াগনোসিস (একাধিক AI মডেল, বিশেষজ্ঞ যাচাইকরণ)

---

## আর্কিটেকচার ওভারভিউ

### Azure-এ পূর্ণাঙ্গ মাল্টি-এজেন্ট সিস্টেম

```mermaid
graph TB
    User[ব্যবহারকারী/API ক্লায়েন্ট]
    APIM[Azure API ব্যবস্থাপনা]
    Orchestrator[অর্কেস্ট্রেটর সার্ভিস<br/>কন্টেইনার অ্যাপ]
    ServiceBus[Azure সার্ভিস বাস<br/>ইভেন্ট হাব]
    
    Agent1[গবেষণা এজেন্ট<br/>কন্টেইনার অ্যাপ]
    Agent2[লেখক এজেন্ট<br/>কন্টেইনার অ্যাপ]
    Agent3[বিশ্লেষক এজেন্ট<br/>কন্টেইনার অ্যাপ]
    Agent4[পর্যালোচক এজেন্ট<br/>কন্টেইনার অ্যাপ]
    
    CosmosDB[(Cosmos DB<br/>শেয়ার্ড স্টেট)]
    Storage[Azure স্টোরেজ<br/>আর্টিফ্যাক্টস]
    AppInsights[অ্যাপ্লিকেশন ইনসাইটস<br/>মনিটরিং]
    
    User --> APIM
    APIM --> Orchestrator
    
    Orchestrator --> ServiceBus
    ServiceBus --> Agent1
    ServiceBus --> Agent2
    ServiceBus --> Agent3
    ServiceBus --> Agent4
    
    Agent1 --> CosmosDB
    Agent2 --> CosmosDB
    Agent3 --> CosmosDB
    Agent4 --> CosmosDB
    
    Agent1 --> Storage
    Agent2 --> Storage
    Agent3 --> Storage
    Agent4 --> Storage
    
    Orchestrator -.-> AppInsights
    Agent1 -.-> AppInsights
    Agent2 -.-> AppInsights
    Agent3 -.-> AppInsights
    Agent4 -.-> AppInsights
    
    style Orchestrator fill:#FF9800,stroke:#F57C00,stroke-width:3px,color:#fff
    style ServiceBus fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
    style CosmosDB fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
**মূল উপাদানসমূহ:**

| উপাদান | উদ্দেশ্য | Azure পরিষেবা |
|-----------|---------|---------------|
| **API Gateway** | প্রবেশদ্বার, রেট সীমাবদ্ধতা, অথেন্টিকেশন | API Management |
| **অর্কেস্ট্রেটর** | এজেন্ট ওয়ার্কফ্লোসমূহ সমন্বয় করে | Container Apps |
| **Message Queue** | অ্যাসিঙ্ক্রোনাস যোগাযোগ | Service Bus / Event Hubs |
| **এজেন্টস** | বিশেষায়িত AI ওয়ার্কার | Container Apps / Functions |
| **স্টেট স্টোর** | শেয়ার্ড স্টেট, টাস্ক ট্র্যাকিং | Cosmos DB |
| **Artifact Storage** | ডকুমেন্ট, ফলাফল, লগস | Blob Storage |
| **মনিটরিং** | বিতরণকৃত ট্রেসিং, লগস | Application Insights |

---

## পূর্বশর্ত

### প্রয়োজনীয় টুলস

```bash
# Azure Developer CLI যাচাই করুন
azd version
# ✅ প্রত্যাশিত: azd সংস্করণ 1.0.0 বা তার বেশি

# Azure CLI যাচাই করুন
az --version
# ✅ প্রত্যাশিত: azure-cli 2.50.0 বা তার বেশি

# Docker যাচাই করুন (লোকাল পরীক্ষার জন্য)
docker --version
# ✅ প্রত্যাশিত: Docker সংস্করণ 20.10 বা তার বেশি
```

### Azure প্রয়োজনীয়তাসমূহ

- সক্রিয় Azure সাবস্ক্রিপশন
- তৈরি করার অনুমতিসমূহ:
  - Container Apps
  - Service Bus namespaces
  - Cosmos DB accounts
  - Storage accounts
  - Application Insights

### জ্ঞানগত পূর্বশর্ত

আপনাকে নিম্নলিখিতগুলো সম্পন্ন করে রাখা উচিত:
- [কনফিগারেশন ব্যবস্থাপনা](../chapter-03-configuration/configuration.md)
- [প্রমাণীকরণ ও নিরাপত্তা](../chapter-03-configuration/authsecurity.md)
- [মাইক্রোসার্ভিস উদাহরণ](../../../../examples/microservices)

---

## বাস্তবায়ন নির্দেশিকা

### প্রজেক্ট স্ট্রাকচার

```
multi-agent-system/
├── azure.yaml                    # AZD configuration
├── infra/
│   ├── main.bicep               # Main infrastructure
│   ├── core/
│   │   ├── servicebus.bicep     # Message queue
│   │   ├── cosmos.bicep         # State store
│   │   ├── storage.bicep        # Artifact storage
│   │   └── monitoring.bicep     # Application Insights
│   └── app/
│       ├── orchestrator.bicep   # Orchestrator service
│       └── agent.bicep          # Agent template
└── src/
    ├── orchestrator/            # Orchestration logic
    │   ├── app.py
    │   ├── workflows.py
    │   └── Dockerfile
    ├── agents/
    │   ├── research/            # Research agent
    │   ├── writer/              # Writer agent
    │   ├── analyst/             # Analyst agent
    │   └── reviewer/            # Reviewer agent
    └── shared/
        ├── state_manager.py     # Shared state logic
        └── message_handler.py   # Message handling
```

---

## পাঠ ১: ধারাবাহিক সমন্বয় প্যাটার্ন

### বাস্তবায়ন: বিষয়বস্তু তৈরির পাইপলাইন

চলুন একটি ধারাবাহিক পাইপলাইন নির্মাণ করি: গবেষণা → লেখা → সম্পাদনা → প্রকাশ

### 1. AZD কনফিগারেশন

**ফাইল: `azure.yaml`**

```yaml
name: content-pipeline
metadata:
  template: multi-agent-sequential@1.0.0

services:
  orchestrator:
    project: ./src/orchestrator
    language: python
    host: containerapp
  
  research-agent:
    project: ./src/agents/research
    language: python
    host: containerapp
  
  writer-agent:
    project: ./src/agents/writer
    language: python
    host: containerapp
  
  editor-agent:
    project: ./src/agents/editor
    language: python
    host: containerapp
```

### 2. ইনফ্রাস্ট্রাকচার: সমন্বয়ের জন্য Service Bus

**ফাইল: `infra/core/servicebus.bicep`**

```bicep
param name string
param location string
param tags object = {}

resource serviceBusNamespace 'Microsoft.ServiceBus/namespaces@2022-10-01-preview' = {
  name: name
  location: location
  tags: tags
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
  properties: {
    minimumTlsVersion: '1.2'
  }
}

// Queue for orchestrator → research agent
resource researchQueue 'Microsoft.ServiceBus/namespaces/queues@2022-10-01-preview' = {
  parent: serviceBusNamespace
  name: 'research-tasks'
  properties: {
    maxDeliveryCount: 3
    lockDuration: 'PT5M'
    deadLetteringOnMessageExpiration: true
  }
}

// Queue for research agent → writer agent
resource writerQueue 'Microsoft.ServiceBus/namespaces/queues@2022-10-01-preview' = {
  parent: serviceBusNamespace
  name: 'writer-tasks'
  properties: {
    maxDeliveryCount: 3
    lockDuration: 'PT5M'
  }
}

// Queue for writer agent → editor agent
resource editorQueue 'Microsoft.ServiceBus/namespaces/queues@2022-10-01-preview' = {
  parent: serviceBusNamespace
  name: 'editor-tasks'
  properties: {
    maxDeliveryCount: 3
    lockDuration: 'PT5M'
  }
}

output namespace string = serviceBusNamespace.name
output connectionString string = listKeys('${serviceBusNamespace.id}/AuthorizationRules/RootManageSharedAccessKey', serviceBusNamespace.apiVersion).primaryConnectionString
```

### 3. শেয়ার্ড স্টেট ম্যানেজার

**ফাইল: `src/shared/state_manager.py`**

```python
from azure.cosmos import CosmosClient, PartitionKey
from datetime import datetime
import os

class StateManager:
    """Manages shared state across agents using Cosmos DB"""
    
    def __init__(self):
        endpoint = os.environ['COSMOS_ENDPOINT']
        key = os.environ['COSMOS_KEY']
        
        self.client = CosmosClient(endpoint, key)
        self.database = self.client.get_database_client('agent-state')
        self.container = self.database.get_container_client('tasks')
    
    def create_task(self, task_id: str, task_type: str, input_data: dict):
        """Create a new task"""
        task = {
            'id': task_id,
            'type': task_type,
            'status': 'pending',
            'input': input_data,
            'created_at': datetime.utcnow().isoformat(),
            'steps': []
        }
        self.container.create_item(task)
        return task
    
    def update_task_step(self, task_id: str, step_name: str, result: dict):
        """Update task with completed step"""
        task = self.container.read_item(task_id, partition_key=task_id)
        
        task['steps'].append({
            'name': step_name,
            'completed_at': datetime.utcnow().isoformat(),
            'result': result
        })
        
        self.container.replace_item(task_id, task)
        return task
    
    def complete_task(self, task_id: str, final_result: dict):
        """Mark task as complete"""
        task = self.container.read_item(task_id, partition_key=task_id)
        task['status'] = 'completed'
        task['result'] = final_result
        task['completed_at'] = datetime.utcnow().isoformat()
        self.container.replace_item(task_id, task)
        return task
    
    def get_task(self, task_id: str):
        """Retrieve task state"""
        return self.container.read_item(task_id, partition_key=task_id)
```

### 4. অর্কেস্ট্রেটর সার্ভিস

**ফাইল: `src/orchestrator/app.py`**

```python
from flask import Flask, request, jsonify
from azure.servicebus import ServiceBusClient, ServiceBusMessage
import json
import uuid
import os
from shared.state_manager import StateManager

app = Flask(__name__)
state_manager = StateManager()

# সার্ভিস বাস সংযোগ
servicebus_connection_str = os.environ['SERVICEBUS_CONNECTION_STRING']
servicebus_client = ServiceBusClient.from_connection_string(servicebus_connection_str)

@app.route('/health', methods=['GET'])
def health():
    return jsonify({'status': 'healthy', 'service': 'orchestrator'})

@app.route('/create-content', methods=['POST'])
def create_content():
    """
    Sequential workflow: Research → Write → Edit → Publish
    """
    data = request.json
    topic = data.get('topic')
    
    if not topic:
        return jsonify({'error': 'Topic required'}), 400
    
    # স্টেট স্টোরে টাস্ক তৈরি করুন
    task_id = str(uuid.uuid4())
    task = state_manager.create_task(
        task_id=task_id,
        task_type='content_creation',
        input_data={'topic': topic}
    )
    
    # গবেষণা এজেন্টকে বার্তা পাঠান (প্রথম ধাপ)
    sender = servicebus_client.get_queue_sender('research-tasks')
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'next_queue': 'writer-tasks'  # ফলাফল কোথায় পাঠাতে হবে
        }),
        content_type='application/json'
    )
    
    with sender:
        sender.send_messages(message)
    
    return jsonify({
        'task_id': task_id,
        'status': 'started',
        'workflow': 'sequential',
        'steps': ['research', 'write', 'edit', 'publish'],
        'message': 'Content creation pipeline initiated'
    }), 202

@app.route('/task/<task_id>', methods=['GET'])
def get_task_status(task_id):
    """Check task status"""
    try:
        task = state_manager.get_task(task_id)
        return jsonify(task)
    except Exception as e:
        return jsonify({'error': str(e)}), 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
```

### 5. গবেষণা এজেন্ট

**ফাইল: `src/agents/research/app.py`**

```python
from azure.servicebus import ServiceBusClient, ServiceBusMessage
from openai import AzureOpenAI
import json
import os
import time
from shared.state_manager import StateManager

# ক্লায়েন্টগুলো ইনিশিয়ালাইজ করুন
state_manager = StateManager()
servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

openai_client = AzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    api_version="2024-02-01",
    azure_endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

def process_research_task(message_data):
    """Process research request and pass to writer"""
    task_id = message_data['task_id']
    topic = message_data['topic']
    next_queue = message_data['next_queue']
    
    print(f"🔬 Researching: {topic}")
    
    # গবেষণার জন্য Azure OpenAI-কে কল করুন
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are a research assistant. Provide comprehensive research on the given topic."},
            {"role": "user", "content": f"Research this topic thoroughly: {topic}"}
        ],
        max_tokens=1500
    )
    
    research_results = response.choices[0].message.content
    
    # অবস্থা আপডেট করুন
    state_manager.update_task_step(
        task_id=task_id,
        step_name='research',
        result={'research': research_results}
    )
    
    # পরবর্তী এজেন্ট (লেখক)কে পাঠান
    sender = servicebus_client.get_queue_sender(next_queue)
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'research': research_results,
            'next_queue': 'editor-tasks'
        }),
        content_type='application/json'
    )
    
    with sender:
        sender.send_messages(message)
    
    print(f"✅ Research complete for task {task_id}")

def main():
    """Listen to research queue"""
    receiver = servicebus_client.get_queue_receiver('research-tasks')
    
    print("🔬 Research Agent started, listening for tasks...")
    
    with receiver:
        while True:
            messages = receiver.receive_messages(max_wait_time=5)
            for message in messages:
                try:
                    message_data = json.loads(str(message))
                    process_research_task(message_data)
                    receiver.complete_message(message)
                except Exception as e:
                    print(f"❌ Error processing message: {e}")
                    receiver.abandon_message(message)

if __name__ == '__main__':
    main()
```

### 6. লেখক এজেন্ট

**ফাইল: `src/agents/writer/app.py`**

```python
from azure.servicebus import ServiceBusClient, ServiceBusMessage
from openai import AzureOpenAI
import json
import os
from shared.state_manager import StateManager

state_manager = StateManager()
servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

openai_client = AzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    api_version="2024-02-01",
    azure_endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

def process_writing_task(message_data):
    """Write article based on research"""
    task_id = message_data['task_id']
    topic = message_data['topic']
    research = message_data['research']
    next_queue = message_data['next_queue']
    
    print(f"✍️ Writing article: {topic}")
    
    # আর্টিকেল লিখতে Azure OpenAI-কে কল করুন
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are a professional writer. Write engaging, well-structured articles."},
            {"role": "user", "content": f"Based on this research:\n\n{research}\n\nWrite a comprehensive article about: {topic}"}
        ],
        max_tokens=2000
    )
    
    article_draft = response.choices[0].message.content
    
    # অবস্থা আপডেট করুন
    state_manager.update_task_step(
        task_id=task_id,
        step_name='writing',
        result={'draft': article_draft}
    )
    
    # সম্পাদককে পাঠান
    sender = servicebus_client.get_queue_sender(next_queue)
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'draft': article_draft
        }),
        content_type='application/json'
    )
    
    with sender:
        sender.send_messages(message)
    
    print(f"✅ Article draft complete for task {task_id}")

def main():
    """Listen to writer queue"""
    receiver = servicebus_client.get_queue_receiver('writer-tasks')
    
    print("✍️ Writer Agent started, listening for tasks...")
    
    with receiver:
        while True:
            messages = receiver.receive_messages(max_wait_time=5)
            for message in messages:
                try:
                    message_data = json.loads(str(message))
                    process_writing_task(message_data)
                    receiver.complete_message(message)
                except Exception as e:
                    print(f"❌ Error: {e}")
                    receiver.abandon_message(message)

if __name__ == '__main__':
    main()
```

### 7. সম্পাদক এজেন্ট

**ফাইল: `src/agents/editor/app.py`**

```python
from azure.servicebus import ServiceBusClient
from openai import AzureOpenAI
import json
import os
from shared.state_manager import StateManager

state_manager = StateManager()
servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

openai_client = AzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    api_version="2024-02-01",
    azure_endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

def process_editing_task(message_data):
    """Edit and finalize article"""
    task_id = message_data['task_id']
    topic = message_data['topic']
    draft = message_data['draft']
    
    print(f"📝 Editing article: {topic}")
    
    # সম্পাদনার জন্য Azure OpenAI-কে কল করুন
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are an expert editor. Improve grammar, clarity, and structure."},
            {"role": "user", "content": f"Edit and improve this article:\n\n{draft}"}
        ],
        max_tokens=2000
    )
    
    final_article = response.choices[0].message.content
    
    # কাজটি সম্পন্ন হিসেবে চিহ্নিত করুন
    state_manager.complete_task(
        task_id=task_id,
        final_result={
            'topic': topic,
            'final_article': final_article,
            'word_count': len(final_article.split())
        }
    )
    
    print(f"✅ Article finalized for task {task_id}")

def main():
    """Listen to editor queue"""
    receiver = servicebus_client.get_queue_receiver('editor-tasks')
    
    print("📝 Editor Agent started, listening for tasks...")
    
    with receiver:
        while True:
            messages = receiver.receive_messages(max_wait_time=5)
            for message in messages:
                try:
                    message_data = json.loads(str(message))
                    process_editing_task(message_data)
                    receiver.complete_message(message)
                except Exception as e:
                    print(f"❌ Error: {e}")
                    receiver.abandon_message(message)

if __name__ == '__main__':
    main()
```

### 8. ডেপ্লয় এবং পরীক্ষা

```bash
# শুরু করুন এবং স্থাপন করুন
azd init
azd up

# অর্কেস্ট্রেটরের URL নিন
ORCHESTRATOR_URL=$(azd env get-values | grep ORCHESTRATOR_URL | cut -d '=' -f2 | tr -d '"')

# বিষয়বস্তু তৈরি করুন
curl -X POST $ORCHESTRATOR_URL/create-content \
  -H "Content-Type: application/json" \
  -d '{"topic": "The Future of AI in Healthcare"}'
```

**✅ প্রত্যাশিত আউটপুট:**
```json
{
  "task_id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "status": "started",
  "workflow": "sequential",
  "steps": ["research", "write", "edit", "publish"],
  "message": "Content creation pipeline initiated"
}
```

**টাস্ক অগ্রগতি যাচাই করুন:**
```bash
TASK_ID="a1b2c3d4-e5f6-7890-abcd-ef1234567890"
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ প্রত্যাশিত আউটপুট (সম্পন্ন):**
```json
{
  "id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "type": "content_creation",
  "status": "completed",
  "steps": [
    {
      "name": "research",
      "completed_at": "2025-11-19T10:30:00Z",
      "result": {"research": "..."}
    },
    {
      "name": "writing",
      "completed_at": "2025-11-19T10:32:00Z",
      "result": {"draft": "..."}
    }
  ],
  "result": {
    "topic": "The Future of AI in Healthcare",
    "final_article": "...",
    "word_count": 1500
  }
}
```

---

## পাঠ ২: সমান্তরাল সমন্বয় প্যাটার্ন

### বাস্তবায়ন: বহু-উৎস গবেষণা অ্যাগ্রিগেটর

চলুন একটি সমান্তরাল সিস্টেম নির্মাণ করি যা একাধিক উৎস থেকে একসাথে তথ্য সংগ্রহ করে।

### প্যারালাল অর্কেস্ট্রেটর

**ফাইল: `src/orchestrator/parallel_workflow.py`**

```python
from flask import Flask, request, jsonify
from azure.servicebus import ServiceBusClient, ServiceBusMessage
import json
import uuid
import os
from shared.state_manager import StateManager

app = Flask(__name__)
state_manager = StateManager()

servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

@app.route('/research-parallel', methods=['POST'])
def research_parallel():
    """
    Parallel workflow: Multiple agents work simultaneously
    """
    data = request.json
    query = data.get('query')
    
    task_id = str(uuid.uuid4())
    task = state_manager.create_task(
        task_id=task_id,
        task_type='parallel_research',
        input_data={
            'query': query,
            'agents': ['web', 'academic', 'news', 'social']
        }
    )
    
    # ফ্যান-আউট: সব এজেন্টদের একযোগে পাঠান
    agents = [
        ('web-research-queue', 'web'),
        ('academic-research-queue', 'academic'),
        ('news-research-queue', 'news'),
        ('social-research-queue', 'social')
    ]
    
    for queue_name, agent_type in agents:
        sender = servicebus_client.get_queue_sender(queue_name)
        message = ServiceBusMessage(
            body=json.dumps({
                'task_id': task_id,
                'query': query,
                'agent_type': agent_type,
                'result_queue': 'aggregation-queue'
            }),
            content_type='application/json'
        )
        
        with sender:
            sender.send_messages(message)
    
    return jsonify({
        'task_id': task_id,
        'status': 'started',
        'workflow': 'parallel',
        'agents_dispatched': 4,
        'message': 'Parallel research initiated'
    }), 202

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
```

### একত্রিকরণ লজিক

**ফাইল: `src/agents/aggregator/app.py`**

```python
from azure.servicebus import ServiceBusClient
import json
import os
from collections import defaultdict
from shared.state_manager import StateManager

state_manager = StateManager()
servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

# প্রতিটি টাস্কের জন্য ফলাফল ট্র্যাক করুন
task_results = defaultdict(list)
expected_agents = 4  # ওয়েব, একাডেমিক, সংবাদ, সামাজিক

def process_result(message_data):
    """Aggregate results from parallel agents"""
    task_id = message_data['task_id']
    agent_type = message_data['agent_type']
    result = message_data['result']
    
    # ফলাফল সংরক্ষণ করুন
    task_results[task_id].append({
        'agent': agent_type,
        'data': result
    })
    
    print(f"📊 Received result from {agent_type} agent ({len(task_results[task_id])}/{expected_agents})")
    
    # যাচাই করুন সব এজেন্ট শেষ করেছে কিনা (ফ্যান-ইন)
    if len(task_results[task_id]) == expected_agents:
        print(f"✅ All agents completed for task {task_id}. Aggregating...")
        
        # ফলাফল একত্র করুন
        aggregated = {
            'query': message_data['query'],
            'sources': task_results[task_id],
            'summary': generate_summary(task_results[task_id])
        }
        
        # সম্পন্ন হিসেবে চিহ্নিত করুন
        state_manager.complete_task(task_id, aggregated)
        
        # পরিষ্কার করুন
        del task_results[task_id]
        
        print(f"✅ Aggregation complete for task {task_id}")

def generate_summary(results):
    """Generate summary from all sources"""
    summaries = [r['data'].get('summary', '') for r in results]
    return '\n\n'.join(summaries)

def main():
    """Listen to aggregation queue"""
    receiver = servicebus_client.get_queue_receiver('aggregation-queue')
    
    print("📊 Aggregator started, listening for results...")
    
    with receiver:
        while True:
            messages = receiver.receive_messages(max_wait_time=5)
            for message in messages:
                try:
                    message_data = json.loads(str(message))
                    process_result(message_data)
                    receiver.complete_message(message)
                except Exception as e:
                    print(f"❌ Error: {e}")
                    receiver.abandon_message(message)

if __name__ == '__main__':
    main()
```

**সমান্তরাল প্যাটার্নের সুবিধা:**
- ⚡ **৪ গুণ দ্রুত** (এজেন্টগুলো একই সময়ে চলবে)
- 🔄 **ফল্ট-টলারেন্ট** (আংশিক ফলাফল গ্রহণযোগ্য)
- 📈 **স্কেলেবল** (সহজেই আরও এজেন্ট যোগ করতে পারে)

---

## বাস্তব অনুশীলন

### অনুশীলন ১: টাইমআউট হ্যান্ডলিং যোগ করুন ⭐⭐ (মধ্যম)

**লক্ষ্য**: টাইমআউট লজিক বাস্তবায়ন করুন যাতে অ্যাগ্রিগেটর ধীর এজেন্টগুলোর জন্য অবারিতভাবে অপেক্ষা না করে।

**ধাপগুলি:**

1. **অ্যাগ্রিগেটরে টাইমআউট ট্র্যাকিং যোগ করুন:**

```python
from datetime import datetime, timedelta

task_timeouts = {}  # task_id -> expiration_time

def process_result(message_data):
    task_id = message_data['task_id']
    
    # প্রথম ফলাফলে টাইমআউট সেট করুন
    if task_id not in task_timeouts:
        task_timeouts[task_id] = datetime.utcnow() + timedelta(seconds=30)
    
    task_results[task_id].append({
        'agent': message_data['agent_type'],
        'data': message_data['result']
    })
    
    # পরীক্ষা করুন সম্পন্ন হয়েছে কি না বা টাইমআউট হয়েছে কি না
    if len(task_results[task_id]) == expected_agents or \
       datetime.utcnow() > task_timeouts[task_id]:
        
        print(f"📊 Aggregating with {len(task_results[task_id])}/{expected_agents} results")
        
        aggregated = {
            'query': message_data['query'],
            'sources': task_results[task_id],
            'completed_agents': len(task_results[task_id]),
            'timed_out': len(task_results[task_id]) < expected_agents
        }
        
        state_manager.complete_task(task_id, aggregated)
        
        # পরিচ্ছন্নকরণ
        del task_results[task_id]
        del task_timeouts[task_id]
```

2. **কৃত্রিম বিলম্ব সহ পরীক্ষা করুন:**

```python
# একটি এজেন্টে ধীর প্রক্রিয়াকরণ অনুকরণ করার জন্য বিলম্ব যোগ করুন
import time
time.sleep(35)  # ৩০ সেকেন্ডের টাইমআউট অতিক্রম করে
```

3. **ডেপ্লয় ও যাচাই করুন:**

```bash
azd deploy aggregator

# টাস্ক জমা করুন
curl -X POST $ORCHESTRATOR_URL/research-parallel \
  -H "Content-Type: application/json" \
  -d '{"query": "AI safety research"}'

# 30 সেকেন্ড পর ফলাফল পরীক্ষা করুন
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ সফলতার মাপকাঠি:**
- ✅ ৩০ সেকেন্ড পরে টাস্ক সম্পন্ন হয় এমনকি এজেন্টগুলি অসম্পূর্ণ থাকলেও
- ✅ রেসপন্স আংশিক ফলাফল নির্দেশ করে (`"timed_out": true`)
- ✅ উপলব্ধ ফলাফলগুলি ফেরত দেওয়া হয় (৪টি এজেন্টের মধ্যে ৩টি)

**সময়**: 20-25 minutes

---

### অনুশীলন ২: রিট্রাই লজিক বাস্তবায়ন করুন ⭐⭐⭐ (উন্নত)

**লক্ষ্য**: ব্যর্থ এজেন্ট টাস্কগুলো স্বয়ংক্রিয়ভাবে পুনরায় চেষ্টা করা যাতে ছেড়ে দেওয়ার আগে পুনরায় চেষ্টা করা হয়।

**ধাপগুলি:**

1. **অর্কেস্ট্রেটরে রিট্রাই ট্র্যাকিং যোগ করুন:**

```python
from dataclasses import dataclass
from typing import Dict

@dataclass
class RetryConfig:
    max_retries: int = 3
    backoff_seconds: int = 5

retry_counts: Dict[str, int] = {}  # বার্তা_আইডি -> পুনরায়_চেষ্টা_গণনা

def send_with_retry(queue_name: str, message_data: dict, retry_config: RetryConfig):
    """Send message with retry metadata"""
    message_id = message_data.get('message_id', str(uuid.uuid4()))
    message_data['message_id'] = message_id
    message_data['retry_count'] = retry_counts.get(message_id, 0)
    message_data['max_retries'] = retry_config.max_retries
    
    sender = servicebus_client.get_queue_sender(queue_name)
    message = ServiceBusMessage(
        body=json.dumps(message_data),
        content_type='application/json',
        message_id=message_id
    )
    
    with sender:
        sender.send_messages(message)
```

2. **এজেন্টদের কাছে রিট্রাই হ্যান্ডলার যোগ করুন:**

```python
def process_with_retry(message, receiver, process_func):
    """Process message with automatic retry on failure"""
    try:
        message_data = json.loads(str(message))
        
        # বার্তাটি প্রক্রিয়াকরণ করুন
        process_func(message_data)
        
        # সফল - সম্পন্ন
        receiver.complete_message(message)
        
    except Exception as e:
        message_id = message.message_id
        retry_count = message_data.get('retry_count', 0)
        max_retries = message_data.get('max_retries', 3)
        
        if retry_count < max_retries:
            # পুনরায় চেষ্টা: পরিত্যাগ করুন এবং গণনা বাড়িয়ে পুনরায় কিউতে রাখুন
            print(f"⚠️ Retry {retry_count + 1}/{max_retries} for message {message_id}")
            
            message_data['retry_count'] = retry_count + 1
            
            # একই কিউতে বিলম্বসহ ফেরত পাঠান
            time.sleep(5 * (retry_count + 1))  # ঘাতানুক্রমিক ব্যাকঅফ
            send_with_retry(queue_name, message_data, RetryConfig())
            
            receiver.complete_message(message)  # মূলটি সরান
        else:
            # সর্বাধিক পুনরায় চেষ্টা সীমা অতিক্রম করেছে - ডেড লেটার কিউতে স্থানান্তর করুন
            print(f"❌ Max retries exceeded for message {message_id}")
            receiver.dead_letter_message(
                message,
                reason="MaxRetriesExceeded",
                error_description=str(e)
            )
```

3. **ডেড লেটার কিউ মনিটর করুন:**

```python
def monitor_dead_letters():
    """Check dead letter queue for failed messages"""
    receiver = servicebus_client.get_queue_receiver(
        'research-queue',
        sub_queue='deadletter'
    )
    
    with receiver:
        messages = receiver.receive_messages(max_wait_time=5)
        for message in messages:
            print(f"☠️ Dead letter: {message.message_id}")
            print(f"Reason: {message.dead_letter_reason}")
            print(f"Description: {message.dead_letter_error_description}")
```

**✅ সফলতার মাপকাঠি:**
- ✅ ব্যর্থ টাস্কগুলো স্বয়ংক্রিয়ভাবে পুনরায় চেষ্টা করে (সর্বোচ্চ ৩ বার)
- ✅ রিট্রাইগুলোর মধ্যে ঘাতীয় ব্যাকঅফ (5s, 10s, 15s)
- ✅ সর্বোচ্চ রিট্রাইয়ের পরে, মেসেজগুলো ডেড লেটার কিউ-তে যায়
- ✅ ডেড লেটার কিউ মনিটর ও পুনরায় চালানো যায়

**সময়**: 30-40 minutes

---

### অনুশীলন ৩: সার্কিট ব্রেকার বাস্তবায়ন করুন ⭐⭐⭐ (উন্নত)

**লক্ষ্য**: ব্যর্থ এজেন্টগুলোর কাছে অনুরোধ থামিয়ে কাসকেডিং ব্যর্থতা প্রতিরোধ করা।

**ধাপগুলি:**

1. **সার্কিট ব্রেকার ক্লাস তৈরি করুন:**

```python
from enum import Enum
from datetime import datetime, timedelta

class CircuitState(Enum):
    CLOSED = "closed"      # স্বাভাবিক কার্যক্রম
    OPEN = "open"          # ব্যর্থ হচ্ছে, অনুরোধগুলো প্রত্যাখ্যান করছে
    HALF_OPEN = "half_open"  # পুনরুদ্ধার হয়েছে কি না পরীক্ষা করা হচ্ছে

class CircuitBreaker:
    def __init__(self, failure_threshold=5, timeout_seconds=60):
        self.failure_threshold = failure_threshold
        self.timeout_seconds = timeout_seconds
        self.failure_count = 0
        self.last_failure_time = None
        self.state = CircuitState.CLOSED
    
    def call(self, func):
        """Execute function with circuit breaker protection"""
        if self.state == CircuitState.OPEN:
            # টাইমআউট মেয়াদ শেষ হয়েছে কিনা পরীক্ষা করুন
            if datetime.utcnow() - self.last_failure_time > timedelta(seconds=self.timeout_seconds):
                self.state = CircuitState.HALF_OPEN
                print("🔄 Circuit breaker: HALF_OPEN (testing)")
            else:
                raise Exception(f"Circuit breaker OPEN for agent. Try again in {self.timeout_seconds}s")
        
        try:
            result = func()
            
            # সফল
            if self.state == CircuitState.HALF_OPEN:
                self.state = CircuitState.CLOSED
                self.failure_count = 0
                print("✅ Circuit breaker: CLOSED (recovered)")
            
            return result
            
        except Exception as e:
            self.failure_count += 1
            self.last_failure_time = datetime.utcnow()
            
            if self.failure_count >= self.failure_threshold:
                self.state = CircuitState.OPEN
                print(f"🔴 Circuit breaker: OPEN (too many failures)")
            
            raise e
```

2. **এজেন্ট কলগুলিতে প্রয়োগ করুন:**

```python
# অর্কেস্ট্রেটরে
agent_circuits = {
    'web': CircuitBreaker(failure_threshold=5, timeout_seconds=60),
    'academic': CircuitBreaker(failure_threshold=5, timeout_seconds=60),
    'news': CircuitBreaker(failure_threshold=5, timeout_seconds=60),
    'social': CircuitBreaker(failure_threshold=5, timeout_seconds=60)
}

def send_to_agent(agent_type, message_data):
    """Send with circuit breaker protection"""
    circuit = agent_circuits[agent_type]
    
    try:
        circuit.call(lambda: send_message(agent_type, message_data))
    except Exception as e:
        print(f"⚠️ Skipping {agent_type} agent: {e}")
        # অন্যান্য এজেন্টদের সাথে চালিয়ে যান
```

3. **সার্কিট ব্রেকার পরীক্ষা করুন:**

```bash
# পুনরাবৃত্ত ব্যর্থতা অনুকরণ করুন (একটি এজেন্ট বন্ধ করুন)
az containerapp stop --name web-research-agent --resource-group rg-agents

# একাধিক অনুরোধ পাঠান
for i in {1..10}; do
  curl -X POST $ORCHESTRATOR_URL/research-parallel \
    -H "Content-Type: application/json" \
    -d '{"query": "test query '$i'"}'
  sleep 2
done

# লগ পরীক্ষা করুন - ৫টি ব্যর্থতার পরে সার্কিট খোলা দেখা উচিত
# Container App লগের জন্য Azure CLI ব্যবহার করুন:
az containerapp logs show --name orchestrator --resource-group $RG_NAME --tail 50
```

**✅ সফলতার মাপকাঠি:**
- ✅ ৫টি ব্যর্থতার পরে সার্কিট খোলে (অনুরোধ প্রত্যাখ্যান করে)
- ✅ ৬০ সেকেন্ড পরে সার্কিট হাফ-ওপেন হয় (রিকভারি টেস্ট করে)
- ✅ অন্যান্য এজেন্টগুলি স্বাভাবিকভাবে কাজ চালিয়ে যায়
- ✅ এজেন্ট সুস্থ হলে সার্কিট স্বয়ংক্রিয়ভাবে বন্ধ হয়ে যায়

**সময়**: 40-50 minutes

---

## মনিটরিং এবং ডিবাগিং

### Application Insights দিয়ে বিতরণকৃত ট্রেসিং

**ফাইল: `src/shared/tracing.py`**

```python
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.trace import config_integration
from opencensus.trace.tracer import Tracer
from opencensus.trace.samplers import AlwaysOnSampler
import logging
import os

# ট্রেসিং কনফিগার করুন
config_integration.trace_integrations(['requests', 'logging'])

connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

# ট্রেসার তৈরি করুন
tracer = Tracer(
    exporter=AzureExporter(connection_string=connection_string),
    sampler=AlwaysOnSampler()
)

# লগিং কনফিগার করুন
logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(connection_string=connection_string))
logger.setLevel(logging.INFO)

def trace_agent_call(agent_name, task_id, operation):
    """Trace agent operations"""
    with tracer.span(name=f'{agent_name}.{operation}') as span:
        span.add_attribute('agent', agent_name)
        span.add_attribute('task_id', task_id)
        span.add_attribute('operation', operation)
        
        try:
            result = operation()
            span.add_attribute('status', 'success')
            return result
        except Exception as e:
            span.add_attribute('status', 'error')
            span.add_attribute('error', str(e))
            raise
```

### Application Insights কোয়েরি

**মাল্টি-এজেন্ট ওয়ার্কফ্লো ট্র্যাক করুন:**

```kusto
// Trace complete workflow for a task
traces
| where customDimensions.task_id == "a1b2c3d4-..."
| project timestamp, message, customDimensions.agent, customDimensions.operation
| order by timestamp asc
```

**এজেন্ট পারফরম্যান্স তুলনা:**

```kusto
// Compare agent execution times
dependencies
| where name contains "agent"
| summarize 
    avg_duration = avg(duration),
    p95_duration = percentile(duration, 95),
    count = count()
  by agent = tostring(customDimensions.agent)
| order by avg_duration desc
```

**ব্যর্থতা বিশ্লেষণ:**

```kusto
// Find which agents fail most
exceptions
| where customDimensions.agent != ""
| summarize 
    failure_count = count(),
    unique_errors = dcount(outerMessage)
  by agent = tostring(customDimensions.agent)
| order by failure_count desc
```

---

## খরচ বিশ্লেষণ

### মাল্টি-এজেন্ট সিস্টেম খরচ (মাসিক আনুমানিক)

| উপাদান | কনফিগারেশন | খরচ |
|-----------|--------------|------|
| **অর্কেস্ট্রেটর** | 1 Container App (1 vCPU, 2GB) | $30-50 |
| **৪ এজেন্ট** | 4 Container Apps (0.5 vCPU, 1GB each) | $60-120 |
| **Service Bus** | Standard tier, 10M messages | $10-20 |
| **Cosmos DB** | Serverless, 5GB storage, 1M RUs | $25-50 |
| **Blob Storage** | 10GB storage, 100K operations | $5-10 |
| **Application Insights** | 5GB ingestion | $10-15 |
| **Azure OpenAI** | GPT-4, 10M tokens | $100-300 |
| **মোট** | | **$240-565/month** |

### খরচ অপটিমাইজেশন কৌশল

1. **যতটা সম্ভব সার্ভারলেস ব্যবহার করুন:**
   ```bicep
   // Cosmos DB serverless (no minimum cost)
   properties: {
     databaseAccountOfferType: 'Standard'
     capabilities: [{ name: 'EnableServerless' }]
   }
   ```

2. **আইডলে থাকলে এজেন্টকে শূন্যে স্কেল করুন:**
   ```bicep
   scale: {
     minReplicas: 0  // Scale to zero when no messages
     maxReplicas: 10
   }
   ```

3. **Service Bus-এর জন্য ব্যাচিং ব্যবহার করুন:**
   ```python
   # বার্তাগুলো ব্যাচে পাঠান (সস্তা)
   sender.send_messages([message1, message2, message3])
   ```

4. **ঘনভাবে ব্যবহৃত ফলাফলগুলো ক্যাশ করুন:**
   ```python
   # Azure Cache for Redis ব্যবহার করুন
   if cache.exists(query_hash):
       return cache.get(query_hash)
   ```

---

## সেরা অনুশীলন

### ✅ করণীয়:

1. **আইডেমপটেন্ট অপারেশন ব্যবহার করুন**
   ```python
   # এজেন্ট একই বার্তাকে একাধিকবার নিরাপদে প্রক্রিয়াকরণ করতে পারে
   def process_task(task_id):
       if state_manager.task_exists(task_id):
           print(f"Task {task_id} already processed, skipping")
           return
       # টাস্ক প্রক্রিয়াকরণ...
   ```

2. **ব্যাপক লগিং বাস্তবায়ন করুন**
   ```python
   logger.info(f"Agent: {agent_name}, Task: {task_id}, Action: {action}")
   ```

3. **কোরিলেশন আইডি ব্যবহার করুন**
   ```python
   # সমগ্র ওয়ার্কফ্লো জুড়ে task_id পাস করুন
   message_data = {
       'task_id': task_id,  # কোরিলেশন আইডি
       'timestamp': datetime.utcnow().isoformat()
   }
   ```

4. **মেসেজ TTL (time-to-live) সেট করুন**
   ```bicep
   properties: {
     defaultMessageTimeToLive: 'PT1H'  // 1 hour max
   }
   ```

5. **ডেড লেটার কিউ মনিটর করুন**
   ```python
   # ব্যর্থ বার্তাগুলির নিয়মিত পর্যবেক্ষণ
   monitor_dead_letters()
   ```

### ❌ করবেন না:

1. **বৃত্তাকার নির্ভরতা তৈরি করবেন না**
   ```python
   # ❌ খারাপ: এজেন্ট A → এজেন্ট B → এজেন্ট A (অনন্ত লুপ)
   # ✅ ভালো: স্পষ্টভাবে একটি নির্দেশিত অচক্রাকার গ্রাফ (DAG) নির্ধারণ করুন
   ```

2. **এজেন্ট থ্রেড ব্লক করবেন না**
   ```python
   # ❌ খারাপ: সিঙ্ক্রোনাস অপেক্ষা
   while not task_complete:
       time.sleep(1)
   
   # ✅ ভাল: মেসেজ কিউ কলব্যাক ব্যবহার করুন
   ```

3. **আংশিক ব্যর্থতাগুলো উপেক্ষা করবেন না**
   ```python
   # ❌ খারাপ: একটি এজেন্ট ব্যর্থ হলে পুরো ওয়ার্কফ্লো ব্যর্থ করা
   # ✅ ভাল: ত্রুটি নির্দেশকসহ আংশিক ফলাফল ফিরিয়ে দিন
   ```

4. **অসীম রিট্রাই ব্যবহার করবেন না**
   ```python
   # ❌ খারাপ: চিরকাল পুনরায় চেষ্টা করা
   # ✅ ভাল: max_retries = 3, তারপর ডেড লেটার
   ```

---
## সমস্যাগুলি সমাধান নির্দেশিকা

### সমস্যা: কিউতে বার্তা আটকে আছে

**লক্ষণসমূহ:**
- কিউতে বার্তা জমা হচ্ছে
- এজেন্টগুলো প্রসেস করছে না
- টাস্ক স্ট্যাটাস "pending"-এ আটকে আছে

**নির্ণয়:**
```bash
# কিউয়ের গভীরতা পরীক্ষা করুন
az servicebus queue show \
  --namespace-name mybus \
  --name research-tasks \
  --query "countDetails"

# Azure CLI ব্যবহার করে এজেন্টের লগগুলো পরীক্ষা করুন
az containerapp logs show --name research-agent --resource-group $RG_NAME --tail 50
```

**সমাধানগুলো:**

1. **এজেন্ট রিপ্লিকা বাড়ান:**
   ```bash
   az containerapp update \
     --name research-agent \
     --min-replicas 3 \
     --max-replicas 10
   ```

2. **ডেড লেটার কিউ পরীক্ষা করুন:**
   ```bash
   az servicebus queue show \
     --namespace-name mybus \
     --name research-tasks \
     --query "countDetails.deadLetterMessageCount"
   ```

---

### সমস্যা: টাস্ক টাইমআউট/কখনও সম্পন্ন হয় না

**লক্ষণসমূহ:**
- টাস্ক স্ট্যাটাস "in_progress" অবস্থায় থাকে
- কিছু এজেন্ট সম্পন্ন করে, অন্যরা করে না
- কোনো এরর মেসেজ নেই

**নির্ণয়:**
```bash
# টাস্কের অবস্থা পরীক্ষা করুন
curl $ORCHESTRATOR_URL/task/$TASK_ID

# অ্যাপ্লিকেশন ইনসাইটস পরীক্ষা করুন
# কোয়েরি চালান: traces | where customDimensions.task_id == "..."
```

**সমাধানগুলো:**

1. **অ্যাগ্রিগেটরে টাইমআউট বাস্তবায়ন করুন (অনুশীলন 1)**

2. **Azure Monitor ব্যবহার করে এজেন্ট ব্যর্থতা পরীক্ষা করুন:**
   ```bash
   # azd monitor ব্যবহার করে লগ দেখুন
   azd monitor --logs
   
   # অথবা নির্দিষ্ট কনটেইনার অ্যাপের লগ দেখতে Azure CLI ব্যবহার করুন
   az containerapp logs show --name <agent-name> --resource-group $RG_NAME --follow | grep "ERROR\|FAIL"
   ```

3. **সব এজেন্ট চলমান আছে কি না যাচাই করুন:**
   ```bash
   az containerapp list \
     --resource-group rg-agents \
     --query "[].{name:name, status:properties.runningStatus}"
   ```

---

## আরো জানুন

### অফিসিয়াল ডকুমেন্টেশন
- [Azure Service Bus](https://learn.microsoft.com/azure/service-bus-messaging/service-bus-messaging-overview)
- [Cosmos DB](https://learn.microsoft.com/azure/cosmos-db/introduction)
- [Container Apps DAPR](https://learn.microsoft.com/azure/container-apps/dapr-overview)
- [Multi-Agent Design Patterns](https://learn.microsoft.com/azure/architecture/guide/ai/multi-agent-systems)

### এই কোর্সে পরবর্তী ধাপ
- ← Previous: [ক্ষমতা পরিকল্পনা](capacity-planning.md)
- → Next: [SKU নির্বাচন](sku-selection.md)
- 🏠 [কোর্স হোম](../../README.md)

### সম্পর্কিত উদাহরণসমূহ
- [Microservices Example](../../../../examples/microservices) - সার্ভিস যোগাযোগ প্যাটার্ন
- [Azure OpenAI Example](../../../../examples/azure-openai-chat) - এআই ইন্টিগ্রেশন

---

## সারসংক্ষেপ

**আপনি যা শিখেছেন:**
- ✅ পাঁচটি সমন্বয় প্যাটার্ন (ক্রমিক, সমান্তরাল, স্তরভিত্তিক, ইভেন্ট-চালিত, সম্মতি)
- ✅ Azure-এ মাল্টি-এজেন্ট আর্কিটেকচার (Service Bus, Cosmos DB, Container Apps)
- ✅ বিতরণকৃত এজেন্টগুলোর মধ্যে স্টেট ব্যবস্থাপনা
- ✅ টাইমআউট হ্যান্ডলিং, রিট্রাই, এবং সার্কিট ব্রেকার
- ✅ বিতরণকৃত সিস্টেমের মনিটরিং এবং ডিবাগিং
- ✅ খরচ অপ্টিমাইজেশনের কৌশল

**মুখ্য গ্রহণযোগ্য বিষয়সমূহ:**
1. **সঠিক প্যাটার্ন বেছে নিন** - ক্রমানুসারে ওয়ার্কফ্লো জন্য ক্রমিক, গতি বাড়াতে সমান্তরাল, নমনীয়তার জন্য ইভেন্ট-চালিত
2. **স্টেট সাবধানে পরিচালনা করুন** - ভাগ করা স্টেটের জন্য Cosmos DB বা অনুরূপ ব্যবহার করুন
3. **ব্যর্থতা সুন্দরভাবে হ্যান্ডেল করুন** - টাইমআউট, রিট্রাই, সার্কিট ব্রেকার, ডেড লেটার কিউ
4. **সবকিছু মনিটর করুন** - ডিবাগিংয়ের জন্য বিতরণকৃত ট্রেসিং অপরিহার্য
5. **খরচ অপ্টিমাইজ করুন** - Scale to zero, সার্ভারলেস ব্যবহার করুন, ক্যাশিং বাস্তবায়ন করুন

**পরবর্তী ধাপ:**
1. প্রায়োগিক অনুশীলনগুলো সম্পন্ন করুন
2. আপনার ইউজ কেসের জন্য একটি মাল্টি-এজেন্ট সিস্টেম তৈরি করুন
3. পারফরম্যান্স ও খরচ অপ্টিমাইজ করার জন্য [SKU নির্বাচন](sku-selection.md) অধ্যয়ন করুন

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
দায়মুক্তি:
এই নথিটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। যদিও আমরা নির্ভুলতার চেষ্টা করি, অনুগ্রহ করে জানুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার নিজ ভাষায়ই কর্তৃপক্ষের উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারের ফলে সৃষ্ট কোনো ভুল-বুঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী থাকব না।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->