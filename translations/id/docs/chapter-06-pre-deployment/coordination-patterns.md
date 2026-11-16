# Pola Koordinasi Multi-Agen

⏱️ **Perkiraan Waktu**: 60-75 menit membaca; beberapa jam untuk mengimplementasikan | 💰 **Perkiraan Biaya**: tergantung beban kerja | ⭐ **Kompleksitas**: Lanjutan

**📚 Jalur Pembelajaran:**
- ← Sebelumnya: [Capacity Planning](capacity-planning.md) - Strategi penentuan ukuran dan penskalaan sumber daya
- 🎯 **Anda di sini**: Pola Koordinasi Multi-Agen (Orkestrasi, komunikasi, manajemen status)
- → Selanjutnya: [SKU Selection](sku-selection.md) - Memilih layanan Azure yang tepat
- 🏠 [Beranda Kursus](../../README.md)

---

## Apa yang Akan Anda Pelajari

Dengan menyelesaikan pelajaran ini, Anda akan:
- Memahami pola **arsitektur multi-agen** dan kapan menggunakannya
- Mengimplementasikan **pola orkestrasi** (terpusat, terdesentralisasi, hierarkis)
- Merancang strategi **komunikasi agen** (sinkron, asinkron, berbasis peristiwa)
- Mengelola **status bersama** di antara agen yang terdistribusi
- Menerapkan **sistem multi-agen** di Azure dengan AZD
- Menerapkan **pola koordinasi** untuk skenario AI dunia nyata
- Memantau dan debug sistem agen terdistribusi

## Mengapa Koordinasi Multi-Agen Penting

### Evolusi: Dari Agen Tunggal ke Multi-Agen

**Agen Tunggal (Sederhana):**
```
User → Agent → Response
```
- ✅ Mudah dipahami dan diimplementasikan
- ✅ Cepat untuk tugas sederhana
- ❌ Terbatas oleh kemampuan satu model
- ❌ Tidak dapat memparalelkan tugas kompleks
- ❌ Tidak ada spesialisasi

**Sistem Multi-Agen (Lanjutan):**
```mermaid
graph TD
    Orchestrator[Orchestrator] --> Agent1[Agent1<br/>Plan]
    Orchestrator --> Agent2[Agent2<br/>Code]
    Orchestrator --> Agent3[Agent3<br/>Review]
```
- ✅ Agen khusus untuk tugas spesifik
- ✅ Eksekusi paralel untuk kecepatan
- ✅ Modular dan mudah dipelihara
- ✅ Lebih baik untuk alur kerja kompleks
- ⚠️ Membutuhkan logika koordinasi

**Analogi**: Agen tunggal seperti satu orang mengerjakan semua tugas. Multi-agen seperti tim di mana setiap anggota memiliki keahlian khusus (peneliti, pemrogram, pemeriksa, penulis) bekerja bersama.

---

## Pola Koordinasi Inti

### Pola 1: Koordinasi Sequential (Rantai Tanggung Jawab)

**Kapan digunakan**: Tugas harus diselesaikan dalam urutan tertentu, setiap agen membangun dari output sebelumnya.

```mermaid
sequenceDiagram
    participant User
    participant Orchestrator
    participant Agent1 as Research Agent
    participant Agent2 as Writer Agent
    participant Agent3 as Editor Agent
    
    User->>Orchestrator: "Write article about AI"
    Orchestrator->>Agent1: Research topic
    Agent1-->>Orchestrator: Research results
    Orchestrator->>Agent2: Write draft (using research)
    Agent2-->>Orchestrator: Draft article
    Orchestrator->>Agent3: Edit and improve
    Agent3-->>Orchestrator: Final article
    Orchestrator-->>User: Polished article
    
    Note over User,Agent3: Sequential: Each step waits for previous
```

**Manfaat:**
- ✅ Aliran data yang jelas
- ✅ Mudah untuk debug
- ✅ Urutan eksekusi dapat diprediksi

**Keterbatasan:**
- ❌ Lebih lambat (tidak ada paralelisme)
- ❌ Satu kegagalan memblokir seluruh rantai
- ❌ Tidak dapat menangani tugas saling bergantung

**Contoh Kasus Penggunaan:**
- Pipeline pembuatan konten (riset → tulis → edit → terbitkan)
- Pembuatan kode (rencana → implementasi → uji → terapkan)
- Pembuatan laporan (pengumpulan data → analisis → visualisasi → ringkasan)

---

### Pola 2: Koordinasi Paralel (Fan-Out/Fan-In)

**Kapan digunakan**: Tugas independen dapat dijalankan bersamaan, hasil digabungkan di akhir.

```mermaid
graph TB
    User[User Request]
    Orchestrator[Orchestrator]
    Agent1[Analysis Agent]
    Agent2[Research Agent]
    Agent3[Data Agent]
    Aggregator[Result Aggregator]
    Response[Combined Response]
    
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

**Manfaat:**
- ✅ Cepat (eksekusi paralel)
- ✅ Tahan kesalahan (hasil parsial diterima)
- ✅ Skalabilitas horizontal

**Keterbatasan:**
- ⚠️ Hasil mungkin tiba tidak berurutan
- ⚠️ Membutuhkan logika agregasi
- ⚠️ Manajemen status kompleks

**Contoh Kasus Penggunaan:**
- Pengumpulan data multi-sumber (API + database + scraping web)
- Analisis kompetitif (beberapa model menghasilkan solusi, dipilih yang terbaik)
- Layanan terjemahan (menerjemahkan ke beberapa bahasa secara simultan)

---

### Pola 3: Koordinasi Hierarkis (Manager-Pekerja)

**Kapan digunakan**: Alur kerja kompleks dengan sub-tugas, diperlukan delegasi.

```mermaid
graph TB
    Master[Master Orchestrator]
    Manager1[Research Manager]
    Manager2[Content Manager]
    W1[Web Scraper]
    W2[Paper Analyzer]
    W3[Writer]
    W4[Editor]
    
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

**Manfaat:**
- ✅ Menangani alur kerja kompleks
- ✅ Modular dan mudah dipelihara
- ✅ Batas tanggung jawab yang jelas

**Keterbatasan:**
- ⚠️ Arsitektur lebih kompleks
- ⚠️ Latensi lebih tinggi (beberapa lapis koordinasi)
- ⚠️ Membutuhkan orkestrasi canggih

**Contoh Kasus Penggunaan:**
- Pemrosesan dokumen perusahaan (klasifikasi → rute → proses → arsip)
- Pipeline data multi-tahap (ingest → bersihkan → transformasi → analisis → laporan)
- Alur kerja otomasi kompleks (perencanaan → alokasi sumber daya → eksekusi → pemantauan)

---

### Pola 4: Koordinasi Berbasis Peristiwa (Publish-Subscribe)

**Kapan digunakan**: Agen perlu bereaksi terhadap peristiwa, diinginkan coupling longgar.

```mermaid
sequenceDiagram
    participant Agent1 as Data Collector
    participant EventBus as Azure Service Bus
    participant Agent2 as Analyzer
    participant Agent3 as Notifier
    participant Agent4 as Archiver
    
    Agent1->>EventBus: Publish "DataReceived" event
    EventBus->>Agent2: Subscribe: Analyze data
    EventBus->>Agent3: Subscribe: Send notification
    EventBus->>Agent4: Subscribe: Archive data
    
    Note over Agent1,Agent4: All subscribers process independently
    
    Agent2->>EventBus: Publish "AnalysisComplete" event
    EventBus->>Agent3: Subscribe: Send analysis report
```

**Manfaat:**
- ✅ Coupling longgar antar agen
- ✅ Mudah menambah agen baru (cukup subscribe)
- ✅ Pemrosesan asinkron
- ✅ Tahan banting (persistensi pesan)

**Keterbatasan:**
- ⚠️ Konsistensi akhirnya
- ⚠️ Debugging kompleks
- ⚠️ Tantangan dalam pengurutan pesan

**Contoh Kasus Penggunaan:**
- Sistem pemantauan waktu nyata (alert, dashboard, log)
- Notifikasi multi-saluran (email, SMS, push, Slack)
- Pipeline pemrosesan data (beberapa konsumen data yang sama)

---

### Pola 5: Koordinasi Berbasis Konsensus (Voting/Quorum)

**Kapan digunakan**: Perlu persetujuan dari beberapa agen sebelum melanjutkan.

```mermaid
graph TB
    Input[Input Task]
    Agent1[Agent 1: gpt-4.1]
    Agent2[Agent 2: Claude]
    Agent3[Agent 3: Gemini]
    Voter[Consensus Voter]
    Output[Agreed Output]
    
    Input --> Agent1
    Input --> Agent2
    Input --> Agent3
    Agent1 --> Voter
    Agent2 --> Voter
    Agent3 --> Voter
    Voter --> Output
    
    style Voter fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
```

**Manfaat:**
- ✅ Akurasi lebih tinggi (beberapa opini)
- ✅ Tahan kesalahan (gagal minoritas dapat diterima)
- ✅ Jaminan kualitas terintegrasi

**Keterbatasan:**
- ❌ Mahal (pemanggilan beberapa model)
- ❌ Lebih lambat (menunggu semua agen)
- ⚠️ Membutuhkan resolusi konflik

**Contoh Kasus Penggunaan:**
- Moderasi konten (beberapa model meninjau konten)
- Review kode (beberapa linter/analis)
- Diagnosis medis (beberapa model AI, validasi ahli)

---

## Ikhtisar Arsitektur

### Sistem Multi-Agen Lengkap di Azure

```mermaid
graph TB
    User[User/API Client]
    APIM[Azure API Management]
    Orchestrator[Orchestrator Service<br/>Container App]
    ServiceBus[Azure Service Bus<br/>Queues / Topics]
    
    Agent1[Research Agent<br/>Container App]
    Agent2[Writer Agent<br/>Container App]
    Agent3[Analyst Agent<br/>Container App]
    Agent4[Reviewer Agent<br/>Container App]
    
    CosmosDB[(Cosmos DB<br/>Shared State)]
    Storage[Azure Storage<br/>Artifacts]
    AppInsights[Application Insights<br/>Monitoring]
    
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

**Komponen Utama:**

| Komponen | Tujuan | Layanan Azure |
|-----------|---------|---------------|
| **API Gateway** | Titik masuk, pembatasan laju, otentikasi | API Management |
| **Orchestrator** | Mengkoordinasi alur kerja agen | Container Apps |
| **Message Queue** | Komunikasi asinkron | Service Bus / Event Hubs |
| **Agen** | Pekerja AI khusus | Container Apps / Functions |
| **State Store** | Status bersama, pelacakan tugas | Cosmos DB |
| **Artifact Storage** | Dokumen, hasil, log | Blob Storage |
| **Monitoring** | Pelacakan terdistribusi, log | Application Insights |

Antrian/topik Service Bus dan Event Hubs adalah layanan berbeda dengan model penyampaian/konsumsi berbeda; Event Hubs bukan pengganti langsung untuk kode pekerja Service Bus di bawah ini. Paralelisme, pesan yang dipersistensi, dan voting model tidak menjamin ketahanan kesalahan atau akurasi lebih tinggi dengan sendirinya.

---

## Prasyarat

### Alat yang Diperlukan

```bash
# Verify Azure Developer CLI
azd version
# Command reference baseline: azd 1.37.2

# Verify Azure CLI
az --version
# ✅ Expected: azure-cli 2.50.0 or higher

# Verify Docker (for local testing)
docker --version
# ✅ Expected: Docker version 20.10 or higher
```

### Persyaratan Azure

- Langganan Azure aktif
- Izin untuk membuat:
  - Container Apps
  - Namespace Service Bus
  - Akun Cosmos DB
  - Akun penyimpanan
  - Application Insights

### Prasyarat Pengetahuan

Anda harus telah menyelesaikan:
- [Manajemen Konfigurasi](../chapter-03-configuration/configuration.md)
- [Otentikasi & Keamanan](../chapter-03-configuration/authsecurity.md)
- [Contoh Microservices](../../../../examples/microservices)

---

## Panduan Implementasi

> **Fragmen desain, bukan lab yang dapat di-deploy:** Struktur proyek dan label `File:` di bawah ini menjelaskan file yang perlu dibuat dalam proyek Anda sendiri; repositori ini tidak berisi aplikasi `multi-agent-system` lengkap. Bagian yang hilang termasuk template utama/parameter, lingkungan/registri Container Apps, Dockerfile dan kunci dependensi, setup database/container Cosmos, deployment model, konfigurasi identitas/peran, aturan skalasi, dan pekerja/antrian paralel. Jangan harap `azd init` menghasilkan file ini atau `azd up` men-deploy cuplikan tanpa perubahan. Untuk titik awal yang dapat dijalankan, selesaikan [Dasar Multi-Agen](../chapter-05-multi-agent/multi-agent-basics.md).

**Asumsi runtime:** Python 3.10+, `azure-servicebus`, `azure-cosmos`, `openai`, Flask, dan (untuk pemantauan) `azure-monitor-opentelemetry`; letakkan `shared` di jalur impor Python dalam setiap image layanan. Kontainer Cosmos `agent-state/tasks` harus sudah ada dengan kunci partisi `/id`. Koneksi berbasis kunci menyederhanakan fragmen ini, bukan panduan produksi: lebih baik gunakan identitas terkelola dengan peran data-plane Service Bus/Cosmos/OpenAI terbatas. Jangan ekspos kunci dalam output atau log.

Pengiriman Service Bus adalah **setidaknya satu kali**. Pertahankan idempoten per tugas **dan langkah**, gunakan konkurensi optimistik (ETags) untuk baca/modifikasi/tulis status, dan perbarui kunci pesan selama pemrosesan panjang. Manajer status sederhana di bawah ini hanya sequential dan tidak menerapkan jaminan produksi tersebut.

### Struktur Proyek

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

## Pelajaran 1: Pola Koordinasi Sequential

### Implementasi: Pipeline Pembuatan Konten

Mari rancang pipeline sequential: Riset → Tulis → Edit. Penerbitan berada di luar contoh ini.

### 1. Konfigurasi AZD

**File: `azure.yaml`**

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

### 2. Infrastruktur: Service Bus untuk Koordinasi

**File: `infra/core/servicebus.bicep`**

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
// Do not output RootManageSharedAccessKey. Resolve scoped credentials
// securely or use managed identity in the application and scale rules.
```

### 3. Manajer Status Bersama

**File: `src/shared/state_manager.py`**

```python
from azure.cosmos import CosmosClient, PartitionKey
from datetime import datetime, timezone
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
            'created_at': datetime.now(timezone.utc).isoformat(),
            'steps': []
        }
        self.container.create_item(task)
        return task
    
    def update_task_step(self, task_id: str, step_name: str, result: dict):
        """Update task with completed step"""
        task = self.container.read_item(task_id, partition_key=task_id)
        
        task['steps'].append({
            'name': step_name,
            'completed_at': datetime.now(timezone.utc).isoformat(),
            'result': result
        })
        
        self.container.replace_item(task_id, task)
        return task
    
    def complete_task(self, task_id: str, final_result: dict):
        """Mark task as complete"""
        task = self.container.read_item(task_id, partition_key=task_id)
        task['status'] = 'completed'
        task['result'] = final_result
        task['completed_at'] = datetime.now(timezone.utc).isoformat()
        self.container.replace_item(task_id, task)
        return task
    
    def get_task(self, task_id: str):
        """Retrieve task state"""
        return self.container.read_item(task_id, partition_key=task_id)
```

### 4. Layanan Orchestrator

**File: `src/orchestrator/app.py`**

```python
from flask import Flask, request, jsonify
from azure.servicebus import ServiceBusClient, ServiceBusMessage
import json
import uuid
import os
from shared.state_manager import StateManager

app = Flask(__name__)
state_manager = StateManager()

# Service Bus connection
servicebus_connection_str = os.environ['SERVICEBUS_CONNECTION_STRING']
servicebus_client = ServiceBusClient.from_connection_string(servicebus_connection_str)

@app.route('/health', methods=['GET'])
def health():
    return jsonify({'status': 'healthy', 'service': 'orchestrator'})

@app.route('/create-content', methods=['POST'])
def create_content():
    """
    Sequential workflow: Research → Write → Edit (returns a draft; no publishing)
    """
    data = request.get_json(silent=True) or {}
    topic = data.get('topic')
    
    if not topic:
        return jsonify({'error': 'Topic required'}), 400
    
    # Create task in state store
    task_id = str(uuid.uuid4())
    task = state_manager.create_task(
        task_id=task_id,
        task_type='content_creation',
        input_data={'topic': topic}
    )
    
    # Send message to research agent (first step)
    sender = servicebus_client.get_queue_sender('research-tasks')
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'next_queue': 'writer-tasks'  # Where to send results
        }),
        content_type='application/json'
    )
    
    with sender:
        sender.send_messages(message)
    
    return jsonify({
        'task_id': task_id,
        'status': 'started',
        'workflow': 'sequential',
        'steps': ['research', 'write', 'edit'],
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

### 5. Agen Peneliti

**File: `src/agents/research/app.py`**

```python
from azure.servicebus import ServiceBusClient, ServiceBusMessage
from openai import AzureOpenAI
import json
import os
import time
from shared.state_manager import StateManager

# Initialize clients
state_manager = StateManager()
servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

openai_client = AzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    api_version="2024-10-21",
    azure_endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

def process_research_task(message_data):
    """Process research request and pass to writer"""
    task_id = message_data['task_id']
    topic = message_data['topic']
    next_queue = message_data['next_queue']
    
    print(f"🔬 Researching: {topic}")
    
    # Call Microsoft Foundry Models for research
    response = openai_client.chat.completions.create(
        model=os.environ['AZURE_OPENAI_DEPLOYMENT'],
        messages=[
            {"role": "system", "content": "You are a research assistant. Provide comprehensive research on the given topic."},
            {"role": "user", "content": f"Research this topic thoroughly: {topic}"}
        ],
        max_tokens=1500
    )
    
    research_results = response.choices[0].message.content
    
    # Update state
    state_manager.update_task_step(
        task_id=task_id,
        step_name='research',
        result={'research': research_results}
    )
    
    # Send to next agent (writer)
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

### 6. Agen Penulis

**File: `src/agents/writer/app.py`**

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
    api_version="2024-10-21",
    azure_endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

def process_writing_task(message_data):
    """Write article based on research"""
    task_id = message_data['task_id']
    topic = message_data['topic']
    research = message_data['research']
    next_queue = message_data['next_queue']
    
    print(f"✍️ Writing article: {topic}")
    
    # Call Microsoft Foundry Models to write article
    response = openai_client.chat.completions.create(
        model=os.environ['AZURE_OPENAI_DEPLOYMENT'],
        messages=[
            {"role": "system", "content": "You are a professional writer. Write engaging, well-structured articles."},
            {"role": "user", "content": f"Based on this research:\n\n{research}\n\nWrite a comprehensive article about: {topic}"}
        ],
        max_tokens=2000
    )
    
    article_draft = response.choices[0].message.content
    
    # Update state
    state_manager.update_task_step(
        task_id=task_id,
        step_name='writing',
        result={'draft': article_draft}
    )
    
    # Send to editor
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

### 7. Agen Editor

**File: `src/agents/editor/app.py`**

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
    api_version="2024-10-21",
    azure_endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

def process_editing_task(message_data):
    """Edit and finalize article"""
    task_id = message_data['task_id']
    topic = message_data['topic']
    draft = message_data['draft']
    
    print(f"📝 Editing article: {topic}")
    
    # Call Microsoft Foundry Models to edit
    response = openai_client.chat.completions.create(
        model=os.environ['AZURE_OPENAI_DEPLOYMENT'],
        messages=[
            {"role": "system", "content": "You are an expert editor. Improve grammar, clarity, and structure."},
            {"role": "user", "content": f"Edit and improve this article:\n\n{draft}"}
        ],
        max_tokens=2000
    )
    
    final_article = response.choices[0].message.content
    
    # Mark task as complete
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

### 8. Deploy dan Uji

Perintah ini berlaku **hanya setelah Anda mengimplementasikan file proyek yang hilang**. Inisialisasi agen Foundry interaktif adalah alur kerja terpisah; tidak menghasilkan desain Service Bus ini.

```bash
# In your completed custom project
azd up

# Alternative in a SEPARATE empty folder (GA bundle workflow requires azd >= 1.37.0)
azd ext install microsoft.foundry
azd ai agent init
azd up
```

> Lihat [Perintah AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) untuk semua bendera dan opsi `azd ai`.

```bash
# Get orchestrator URL
ORCHESTRATOR_URL=$(azd env get-values | grep ORCHESTRATOR_URL | cut -d '=' -f2 | tr -d '"')

# Create content
curl -X POST $ORCHESTRATOR_URL/create-content \
  -H "Content-Type: application/json" \
  -d '{"topic": "The Future of AI in Healthcare"}'
```

**✅ Output yang Diharapkan:**
```json
{
  "task_id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "status": "started",
  "workflow": "sequential",
  "steps": ["research", "write", "edit"],
  "message": "Content creation pipeline initiated"
}
```

**Periksa progres tugas:**
```bash
TASK_ID="a1b2c3d4-e5f6-7890-abcd-ef1234567890"
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Output yang Diharapkan (selesai):**
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

## Pelajaran 2: Pola Koordinasi Paralel

### Implementasi: Agregator Riset Multi-Sumber

Mari bangun sistem paralel yang mengumpulkan informasi dari banyak sumber secara bersamaan.

### Orchestrator Paralel

**File: `src/orchestrator/parallel_workflow.py`**

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
    
    # Fan-out: publish sequentially; workers may process concurrently.
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

### Logika Agregasi

**File: `src/agents/aggregator/app.py`**

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

# Single-process demo only: not durable or shared across replicas.
# Production: use durable unique (task_id, agent_type) result records.
task_results = defaultdict(dict)
expected_agents = 4  # web, academic, news, social

def process_result(message_data):
    """Aggregate results from parallel agents"""
    task_id = message_data['task_id']
    agent_type = message_data['agent_type']
    result = message_data['result']
    
    # Store result
    task_results[task_id][agent_type] = {
        'agent': agent_type,
        'data': result
    }
    
    print(f"📊 Received result from {agent_type} agent ({len(task_results[task_id])}/{expected_agents})")
    
    # Check if all agents completed (fan-in)
    if len(task_results[task_id]) == expected_agents:
        print(f"✅ All agents completed for task {task_id}. Aggregating...")
        
        # Combine results
        aggregated = {
            'query': message_data['query'],
            'sources': list(task_results[task_id].values()),
            'summary': generate_summary(list(task_results[task_id].values()))
        }
        
        # Mark complete
        state_manager.complete_task(task_id, aggregated)
        
        # Clean up
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

**Manfaat Pola Paralel:**
- ⚡ **Potensi latensi lebih rendah** (terbatas oleh pekerja terlambat ditambah overhead koordinasi)
- 🔄 **Dapat mendukung hasil parsial** dengan batas waktu eksplisit dan kebijakan kegagalan (tidak diterapkan oleh agregator dasar)
- 📈 **Skalabel** (mudah menambah agen)

---

## Latihan Praktis

### Latihan 1: Tambahkan Penanganan Timeout ⭐⭐ (Menengah)

**Tujuan**: Menerapkan logika timeout agar agregator tidak menunggu agen lambat tanpa batas.

**Titik awal:** Jalankan simulasi batas waktu lokal ini sebelum mengintegrasikannya ke pekerja antrian. Timeout yang dicek hanya saat pesan lain datang tidak pernah terjadi jika pekerja yang hilang tidak mengirim apa pun.

**Langkah-langkah**:

1. **Tambahkan pelacakan timeout ke agregator:**

```python
import asyncio

async def simulated_agent(name, delay):
    await asyncio.sleep(delay)
    return {'agent': name, 'result': 'done'}

async def main():
    tasks = [asyncio.create_task(simulated_agent(name, delay))
             for name, delay in [('web', 0.1), ('academic', 0.2),
                                 ('news', 0.3), ('social', 3)]]
    done, pending = await asyncio.wait(tasks, timeout=1)
    results = [task.result() for task in done]
    for task in pending:
        task.cancel()
    await asyncio.gather(*pending, return_exceptions=True)
    print({'completed_agents': len(results), 'timed_out': bool(pending)})
    assert len(results) == 3 and pending

asyncio.run(main())
```

2. **Output yang diharapkan:**

```text
{'completed_agents': 3, 'timed_out': True}
```

3. **Integrasi dengan sistem antrian (tugas desain):** Pertahankan batas waktu pengiriman dan agen yang diharapkan saat membuat tugas, jalankan sweep batas waktu berkala independen dari hasil yang datang, selesaikan hasil parsial secara atomik, dan abaikan pesan terlambat/duplikat untuk tugas yang telah selesai. Timeout lokal tidak membatalkan pekerja jarak jauh.

Hanya untuk proyek yang Anda implementasikan:

```bash
azd deploy aggregator

# Submit task
curl -X POST $ORCHESTRATOR_URL/research-parallel \
  -H "Content-Type: application/json" \
  -d '{"query": "AI safety research"}'

# Check results after 30 seconds
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Kriteria Keberhasilan:**
- ✅ Tes lokal selesai setelah batas waktu satu detik bahkan jika agen belum selesai
- ✅ Respons menunjukkan hasil parsial (`"timed_out": true`)
- ✅ Hasil tersedia dikembalikan (3 dari 4 agen)

**Waktu**: 20-25 menit

---

### Latihan 2: Terapkan Logika Retry ⭐⭐⭐ (Lanjutan)

**Tujuan**: Coba ulang tugas agen yang gagal secara otomatis sebelum menyerah.

**Langkah-langkah**:

1. **Gunakan hitungan pengiriman Service Bus daripada penghitung retry kustom saat enqueue ulang:**

```python
import json
import time
# Integration fragment: use a live peek-lock ServiceBusReceiver.
# Set queue maxDeliveryCount to 4 for one attempt + up to three retries.
```

2. **Tambahkan handler retry ke agen:**

```python
def process_with_retry(message, receiver, process_func):
    """Process message with automatic retry on failure"""
    try:
        message_data = json.loads(str(message))
        
        # Process the message
        process_func(message_data)
        
        # Success - complete
        receiver.complete_message(message)
        
    except Exception as e:
        if message.delivery_count < 4:
            # Bounded exponential delay: 5s, 10s, 20s.
            # Renew the lock if processing + waiting can exceed its duration.
            time.sleep(5 * 2 ** (message.delivery_count - 1))
            receiver.abandon_message(message)
        else:
            # Max retries exceeded - move to dead letter queue
            print(f"❌ Max attempts exceeded for message {message.message_id}")
            receiver.dead_letter_message(
                message,
                reason="MaxRetriesExceeded",
                error_description=str(e)
            )
```

3. **Pantau antrian dead letter:**

```python
def monitor_dead_letters():
    """Check dead letter queue for failed messages"""
    receiver = servicebus_client.get_queue_receiver(
        'research-tasks',
        sub_queue='deadletter'
    )
    
    with receiver:
        messages = receiver.receive_messages(max_wait_time=5)
        for message in messages:
            print(f"☠️ Dead letter: {message.message_id}")
            print(f"Reason: {message.dead_letter_reason}")
            print(f"Description: {message.dead_letter_error_description}")
```

**✅ Kriteria Keberhasilan:**
- ✅ Tugas gagal dicoba ulang otomatis (hingga 3 kali)
- ✅ Backoff eksponensial antara retry (5s, 10s, 20s), dengan pembaruan kunci pesan di mana diperlukan
- ✅ Setelah retry maksimal, pesan masuk ke antrian dead letter
- ✅ Pesan dead letter dapat diperiksa; pemutaran ulang membutuhkan alur pemulihan idempoten terpisah

**Waktu**: 30-40 menit

---

### Latihan 3: Terapkan Circuit Breaker ⭐⭐⭐ (Lanjutan)

**Tujuan**: Mencegah kegagalan berantai dengan menghentikan permintaan ke agen yang gagal.

**Langkah-langkah**:

1. **Buat kelas circuit breaker:**

```python
from enum import Enum
from datetime import datetime, timedelta, timezone

class CircuitState(Enum):
    CLOSED = "closed"      # Normal operation
    OPEN = "open"          # Failing, reject requests
    HALF_OPEN = "half_open"  # Testing if recovered

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
            # Check if timeout expired
            if datetime.now(timezone.utc) - self.last_failure_time > timedelta(seconds=self.timeout_seconds):
                self.state = CircuitState.HALF_OPEN
                print("🔄 Circuit breaker: HALF_OPEN (testing)")
            else:
                raise Exception(f"Circuit breaker OPEN for agent. Try again in {self.timeout_seconds}s")
        
        try:
            result = func()
            
            # Success
            self.failure_count = 0 # Count consecutive failures only
            if self.state == CircuitState.HALF_OPEN:
                self.state = CircuitState.CLOSED
                self.failure_count = 0
                print("✅ Circuit breaker: CLOSED (recovered)")
            
            return result
            
        except Exception as e:
            self.failure_count += 1
            self.last_failure_time = datetime.now(timezone.utc)
            
            if self.failure_count >= self.failure_threshold:
                self.state = CircuitState.OPEN
                print(f"🔴 Circuit breaker: OPEN (too many failures)")
            
            raise
```

2. **Terapkan ke panggilan agen:**

```python
# In orchestrator
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
        # Continue with other agents
```

Rangkaian ini melindungi **operasi pengiriman**, bukan penyelesaian oleh pekerja jarak jauh: berhasil memasukkan pesan ke antrean tidak mengatakan apa pun tentang apakah agen masih hidup. `send_message` adalah fungsi pengirim aplikasi Anda. Untuk rangkaian eksekusi, masukkan kegagalan/tenggat waktu tugas yang diamati ke koordinator yang tahan lama. Kelas dalam memori ini adalah demonstrasi satu-thread, bukan pemutus rangkaian terdistribusi.

3. **Uji pemutus rangkaian secara lokal:**

```python
# Run after the class definition; no Azure changes required.
circuit = CircuitBreaker(failure_threshold=5, timeout_seconds=0)
def fail():
    raise RuntimeError("simulated failure")
for _ in range(5):
    try:
        circuit.call(fail)
    except RuntimeError:
        pass
assert circuit.state == CircuitState.OPEN
assert circuit.call(lambda: "recovered") == "recovered"
assert circuit.state == CircuitState.CLOSED
print("Circuit breaker recovery verified")
```

**✅ Kriteria Keberhasilan:**
- ✅ Setelah 5 kegagalan, rangkaian terbuka (menolak permintaan)
- ✅ Setelah 60 detik, rangkaian menjadi setengah terbuka (menguji pemulihan)
- ✅ Agen lain melanjutkan kerja secara normal
- ✅ Rangkaian menutup otomatis ketika agen pulih

**Waktu**: 40-50 menit

---

## Pemantauan dan Debugging

### Pelacakan Terdistribusi dengan Application Insights

**Berkas: `src/shared/tracing.py`**

```python
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace
from opentelemetry.trace import SpanKind
import logging
import os

connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

# Configure once per process. Message send/receive trace-context propagation
# and agent attributes on exceptions need explicit instrumentation.
if connection_string:
    configure_azure_monitor(connection_string=connection_string, logger_name=__name__)
tracer = trace.get_tracer(__name__)

# Configure logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)

def trace_agent_call(agent_name, task_id, operation_name, operation):
    """Trace agent operations"""
    with tracer.start_as_current_span(f'agent.{agent_name}.{operation_name}', kind=SpanKind.CLIENT) as span:
        span.set_attribute('agent', agent_name)
        span.set_attribute('task_id', task_id)
        span.set_attribute('operation', operation_name)
        
        try:
            result = operation()
            span.set_attribute('status', 'success')
            logger.info('Agent operation completed', extra={
                'agent': agent_name, 'task_id': task_id, 'operation': operation_name
            })
            return result
        except Exception as e:
            span.set_attribute('status', 'error')
            logger.exception('Agent operation failed', extra={
                'agent': agent_name, 'task_id': task_id, 'operation': operation_name
            })
            raise
```

### Query Application Insights

**Lacak alur kerja multi-agen:**

```kusto
// Trace complete workflow for a task
traces
| where customDimensions.task_id == "a1b2c3d4-..."
| project timestamp, message, customDimensions.agent, customDimensions.operation
| order by timestamp asc
```

**Perbandingan performa agen:**

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

**Analisis kegagalan:**

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

## Analisis Biaya

### Perkiraan Biaya Sistem Multi-Agen (Bulanan)

Angka planning ilustratif saja, bukan penawaran harga: jumlah di bawah adalah **$240-565/bulan**. Verifikasi tarif regional saat ini, jam replikasi aktif/diam, campuran token input/output, penyimpanan, dan telemetri. Serverless tidak memiliki minimum throughput yang diprovisikan tetapi tetap membebankan permintaan dan penyimpanan.

| Komponen | Konfigurasi | Biaya |
|-----------|--------------|------|
| **Orchestrator** | 1 Container App (1 vCPU, 2GB) | $30-50 |
| **4 Agen** | 4 Container Apps (0.5 vCPU, 1GB masing-masing) | $60-120 |
| **Service Bus** | Tingkat standar, 10J pesan | $10-20 |
| **Cosmos DB** | Serverless, penyimpanan 5GB, 1J RU | $25-50 |
| **Blob Storage** | Penyimpanan 10GB, 100K operasi | $5-10 |
| **Application Insights** | Ingesti 5GB | $10-15 |
| **Microsoft Foundry Models** | gpt-4.1, 10J token | $100-300 |
| **Total** | | **$240-565/bulan** |

### Strategi Optimasi Biaya

1. **Gunakan serverless bila memungkinkan:**
   ```bicep
   // Cosmos DB serverless (no minimum cost)
   properties: {
     databaseAccountOfferType: 'Standard'
     capabilities: [{ name: 'EnableServerless' }]
   }
   ```

2. **Skalakan agen ke nol saat menganggur:**
   ```bicep
   scale: {
     minReplicas: 0  // Requires a Service Bus/KEDA scale rule to wake workers
     maxReplicas: 10
   }
   ```

3. **Gunakan batching untuk Service Bus:**
   ```python
   # Send messages in batches (cheaper)
   sender.send_messages([message1, message2, message3])
   ```

4. **Cache hasil yang sering digunakan:**
   ```python
   # Use Azure Cache for Redis
   if cache.exists(query_hash):
       return cache.get(query_hash)
   ```

---

## Praktik Terbaik

### ✅ LAKUKAN:

1. **Gunakan operasi idempoten**
   ```python
   # Pseudocode: implement a durable, atomic per-step deduplication claim.
   def process_task(task_id):
       raise NotImplementedError("Claim (task_id, step) atomically, execute, persist outcome")
   ```

2. **Implementasikan logging yang komprehensif**
   ```python
   logger.info(f"Agent: {agent_name}, Task: {task_id}, Action: {action}")
   ```

3. **Gunakan ID korelasi**
   ```python
   # Pass task_id through entire workflow
   message_data = {
       'task_id': task_id,  # Correlation ID
       'timestamp': datetime.utcnow().isoformat()
   }
   ```

4. **Atur TTL pesan (time-to-live)**
   ```bicep
   properties: {
     defaultMessageTimeToLive: 'PT1H'  // 1 hour max
   }
   ```

5. **Pantau antrean surat mati**
   ```python
   # Regular monitoring of failed messages
   monitor_dead_letters()
   ```

### ❌ JANGAN:

1. **Jangan buat ketergantungan melingkar**
   ```python
   # ❌ BAD: Agent A → Agent B → Agent A (infinite loop)
   # ✅ GOOD: Define clear directed acyclic graph (DAG)
   ```

2. **Jangan blokir thread agen**
   ```python
   # ❌ BAD: Synchronous wait
   while not task_complete:
       time.sleep(1)
   
   # ✅ GOOD: Use message queue callbacks
   ```

3. **Jangan abaikan kegagalan parsial**
   ```python
   # ❌ BAD: Fail entire workflow if one agent fails
   # ✅ GOOD: Return partial results with error indicators
   ```

4. **Jangan gunakan pengulangan tak terbatas**
   ```python
   # ❌ BAD: retry forever
   # ✅ GOOD: max_retries = 3, then dead letter
   ```

---

## Panduan Pemecahan Masalah

### Masalah: Pesan tersangkut di antrean

**Gejala:**
- Pesan menumpuk di antrean
- Agen tidak memproses
- Status tugas tersangkut di "pending"

**Diagnosis:**
```bash
# Check queue depth
az servicebus queue show \
  --resource-group "$RG_NAME" \
  --namespace-name mybus \
  --name research-tasks \
  --query "countDetails"

# Check agent logs using Azure CLI
az containerapp logs show --name research-agent --resource-group $RG_NAME --tail 50
```

**Solusi:**

1. **Tingkatkan replikasi agen:**
   ```bash
   az containerapp update \
     --resource-group "$RG_NAME" \
     --name research-agent \
     --min-replicas 3 \
     --max-replicas 10
   ```

2. **Periksa antrean surat mati:**
   ```bash
   az servicebus queue show \
     --resource-group "$RG_NAME" \
     --namespace-name mybus \
     --name research-tasks \
     --query "countDetails.deadLetterMessageCount"
   ```

---

### Masalah: Tugas timeout/tidak pernah selesai

**Gejala:**
- Status tugas tetap "in_progress"
- Beberapa agen menyelesaikan, yang lain tidak
- Tidak ada pesan kesalahan

**Diagnosis:**
```bash
# Check task state
curl $ORCHESTRATOR_URL/task/$TASK_ID

# Check Application Insights
# Run query: traces | where customDimensions.task_id == "..."
```

**Solusi:**

1. **Implementasikan timeout di agregator (Latihan 1)**

2. **Periksa kegagalan agen menggunakan Azure Monitor:**
   ```bash
   # View logs via azd monitor
   azd monitor --logs
   
   # Or use Azure CLI to check specific container app logs
   az containerapp logs show --name <agent-name> --resource-group $RG_NAME --follow | grep "ERROR\|FAIL"
   ```

3. **Verifikasi semua agen berjalan:**
   ```bash
   az containerapp list \
     --resource-group rg-agents \
     --query "[].{name:name, status:properties.runningStatus}"
   ```

---

## Pelajari Lebih Lanjut

### Dokumentasi Resmi
- [Azure Service Bus](https://learn.microsoft.com/azure/service-bus-messaging/service-bus-messaging-overview)
- [Cosmos DB](https://learn.microsoft.com/azure/cosmos-db/introduction)
- [Container Apps DAPR](https://learn.microsoft.com/azure/container-apps/dapr-overview)
- [Polap Orkestrasi AI Agen](https://learn.microsoft.com/azure/architecture/ai-ml/guide/ai-agent-design-patterns)

### Langkah Berikutnya dalam Kursus Ini
- ← Sebelumnya: [Perencanaan Kapasitas](capacity-planning.md)
- → Berikutnya: [Pemilihan SKU](sku-selection.md)
- 🏠 [Beranda Kursus](../../README.md)

### Contoh Terkait
- [Contoh Microservices](../../../../examples/microservices) - Pola komunikasi layanan
- [Contoh Microsoft Foundry Models](../../../../examples/azure-openai-chat) - Integrasi AI

---

## Ringkasan

**Anda telah belajar:**
- ✅ Lima pola koordinasi (berurutan, paralel, hirarkis, berbasis acara, konsensus)
- ✅ Arsitektur multi-agen di Azure (Service Bus, Cosmos DB, Container Apps)
- ✅ Manajemen status di antara agen terdistribusi
- ✅ Penanganan timeout, pengulangan, dan pemutus rangkaian
- ✅ Pemantauan dan debugging sistem terdistribusi
- ✅ Strategi optimasi biaya

**Pokok Poin Penting:**
1. **Pilih pola yang tepat** - Berurutan untuk alur kerja berurutan, paralel untuk kecepatan, berbasis acara untuk fleksibilitas
2. **Kelola status dengan hati-hati** - Gunakan Cosmos DB atau sejenisnya untuk status bersama
3. **Tangani kegagalan dengan baik** - Timeout, pengulangan, pemutus rangkaian, antrean surat mati
4. **Pantau semuanya** - Pelacakan terdistribusi penting untuk debugging
5. **Optimalkan biaya** - Skala ke nol, gunakan serverless, implementasikan caching

**Langkah Berikutnya:**
1. Selesaikan latihan praktis
2. Bangun sistem multi-agen untuk kasus penggunaan Anda
3. Pelajari [Pemilihan SKU](sku-selection.md) untuk optimasi performa dan biaya

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->