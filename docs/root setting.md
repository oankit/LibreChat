Docs
⚙️ Configuration
librechat.yaml
Settings
Root Settings
Config Structure
Note: Fields not specifically mentioned as required are optional.

version
required
Key	Type	Description	Example
version	String	Specifies the version of the configuration file.	version: 1.2.8
cache
Key	Type	Description	Example
cache	Boolean	Toggles caching on or off. Set to `true` to enable caching (default).	cache: true
fileStrategy
Options: “local” | “firebase” | “s3” | “azure_blob”
Key	Type	Description	Example
fileStrategy	String	Determines where to save user uploaded/generated files. Defaults to `"local"` if omitted.	fileStrategy: "firebase"
Notes:
You can choose from several different CDNs to store files.
Please refer to the CDN documentation for more details
filteredTools
Key	Type	Description	Example
filteredTools	Array of Strings	Filters out specific tools from both Plugins and OpenAI Assistants endpoints.	filteredTools: ["scholarai", "calculator"]
Notes:
If includedTools and filteredTools are both specified, only includedTools will be recognized.
Affects both gptPlugins and assistants endpoints
You can find the names of the tools to filter in api/app/clients/tools/manifest.json
Use the pluginKey value
Also, any listed under the “.well-known” directory api/app/clients/tools/.well-known
Use the name_for_model value
includedTools
Key	Type	Description	Example
includedTools	Array of Strings	Includes specific tools from both Plugins and OpenAI Assistants endpoints.	includedTools: ["calculator"]
Notes:
If includedTools and filteredTools are both specified, only includedTools will be recognized.
Affects both gptPlugins and assistants endpoints
You can find the names of the tools to filter in api/app/clients/tools/manifest.json
Use the pluginKey value
Also, any listed under the “.well-known” directory api/app/clients/tools/.well-known
Use the name_for_model value
secureImageLinks
Key	Type	Description	Example
secureImageLinks	Boolean	Whether or not to secure access to image links that are hosted locally by the app. Default: false.	secureImageLinks: true
imageOutputType
Note: Case-sensitive. Google endpoint only supports “jpeg” and “png” output types.
Options: “png” | “webp” | “jpeg”
Key	Type	Description	Example
imageOutputType	String	The image output type for image responses. Defaults to "png" if omitted.	imageOutputType: "webp"
ocr
Key:

Key	Type	Description	Example
ocr	Object	Configures Optical Character Recognition (OCR) settings for extracting text from images.	
Subkeys:

Key	Type	Description	Example
apiKey	String	The API key for the OCR service.	
baseURL	String	The base URL for the OCR service API.	
strategy	String	The OCR strategy to use. Options are "mistral_ocr" or "custom_ocr".	
mistralModel	String	The Mistral model to use for OCR processing.	
see: OCR Config Object Structure

webSearch
Key:

Key	Type	Description	Example
webSearch	Object	Configures web search functionality, including search providers, content scrapers, and result rerankers.	
Subkeys:

Key	Type	Description	Example
serperApiKey	String	Environment variable name for the Serper API key. If not set in .env, users will be prompted to provide it via UI.	
searxngInstanceUrl	String	Environment variable name for the SearXNG instance URL. If not set in .env, users will be prompted to provide it via UI.	
searxngApiKey	String	Environment variable name for the SearXNG API key. If not set in .env, users will be prompted to provide it via UI.	
firecrawlApiKey	String	Environment variable name for the Firecrawl API key. If not set in .env, users will be prompted to provide it via UI.	
firecrawlApiUrl	String	Environment variable name for the Firecrawl API URL. If not set in .env, users will be prompted to provide it via UI.	
jinaApiKey	String	Environment variable name for the Jina API key. If not set in .env, users will be prompted to provide it via UI.	
cohereApiKey	String	Environment variable name for the Cohere API key. If not set in .env, users will be prompted to provide it via UI.	
searchProvider	String	Specifies which search provider to use. Options: "serper", "searxng".	
scraperType	String	Specifies which scraper service to use. Options: "firecrawl", "serper".	
rerankerType	String	Specifies which reranker service to use. Options: "jina", "cohere".	
scraperTimeout	Number	Timeout in milliseconds for scraper requests.	
safeSearch	Boolean	Enables safe search mode to filter out inappropriate content.	
see: Web Search Object Structure

fileConfig
Key:

Key	Type	Description	Example
fileConfig	Object	Configures file handling settings for the application, including size limits and MIME type restrictions.	
Subkeys:

Key	Type	Description	Example
endpoints	Record/Object	Specifies file handling configurations for individual endpoints, allowing customization per endpoint basis.	
serverFileSizeLimit	Number	The maximum file size (in MB) that the server will accept. Applies globally across all endpoints unless overridden by endpoint-specific settings.	
avatarSizeLimit	Number	Maximum size (in MB) for user avatar images.	
clientImageResize	Object	Configures client-side image resizing to optimize file uploads and prevent upload errors due to large image sizes.	
clientImageResize
Key:

Key	Type	Description	Example
clientImageResize	Object	Configures client-side image resizing to optimize file uploads and prevent upload errors due to large image sizes.	
Subkeys:

Key	Type	Description	Example
enabled	Boolean	Enables or disables client-side image resizing functionality. Default: false.	enabled: true
maxWidth	Number	Maximum width in pixels for resized images. Images wider than this will be resized. Default: 1920.	maxWidth: 1024
maxHeight	Number	Maximum height in pixels for resized images. Images taller than this will be resized. Default: 1080.	maxHeight: 768
quality	Number	JPEG compression quality (0.1 to 1.0). Higher values mean better quality but larger file sizes. Default: 0.8.	quality: 0.9
compressFormat	String	Output format for compressed images. Options: "jpeg", "webp". Default: "jpeg".	compressFormat: "webp"
Description:

The clientImageResize configuration enables automatic client-side image resizing before upload. This feature helps:

Prevent upload failures due to large image files exceeding server limits
Reduce bandwidth usage by compressing images before transmission
Improve upload performance with smaller file sizes
Maintain image quality while optimizing file size
When enabled, images that exceed the specified maxWidth or maxHeight dimensions are automatically resized on the client side before being uploaded to the server. The resizing maintains the original aspect ratio while ensuring the image fits within the specified bounds.

Example:

clientImageResize

fileConfig:
  clientImageResize:
    enabled: true
    maxWidth: 1920
    maxHeight: 1080
    quality: 0.8
    compressFormat: "jpeg"
Notes:

Only applies to image files (JPEG, PNG, WebP, etc.)
Resizing occurs automatically when images exceed the specified dimensions
Original aspect ratio is preserved during resizing
The feature works with all supported image upload endpoints
Quality setting only applies to JPEG and WebP formats
Setting quality too low (< 0.5) may result in noticeable image degradation
see: File Config Object Structure

rateLimits
Key:

Key	Type	Description	Example
rateLimits	Object	Defines rate limiting policies to prevent abuse by limiting the number of requests.	
Subkeys:

Key	Type	Description	Example
fileUploads	Object	Configures rate limits specifically for file upload operations.	
conversationsImport	Object	Configures rate limits specifically for conversation import operations.	
stt	Object	Configures rate limits specifically for speech-to-text (stt) requests	
tts	Object	Configures rate limits specifically for text-to-speech (tts) requests	
fileUploads Subkeys:

Key	Type	Description	Example
ipMax	Number	Maximum number of uploads allowed per IP address per window.	
ipWindowInMinutes	Number	Time window in minutes for the IP-based upload limit.	
userMax	Number	Maximum number of uploads allowed per user per window.	
userWindowInMinutes	Number	Time window in minutes for the user-based upload limit.	
conversationsImport Subkeys:

Key	Type	Description	Example
ipMax	Number	Maximum number of imports allowed per IP address per window.	
ipWindowInMinutes	Number	Time window in minutes for the IP-based imports limit.	
userMax	Number	Maximum number of imports per user per window.	
userWindowInMinutes	Number	Time window in minutes for the user-based imports limit.	
tts Subkeys:

Key	Type	Description	Example
ipMax	Number	Maximum number of requests allowed per IP address per window.	
ipWindowInMinutes	Number	Time window in minutes for the IP-based requests limit.	
userMax	Number	Maximum number of requests per user per window.	
userWindowInMinutes	Number	Time window in minutes for the user-based requests limit.	
stt Subkeys:

Key	Type	Description	Example
ipMax	Number	Maximum number of requests allowed per IP address per window.	
ipWindowInMinutes	Number	Time window in minutes for the IP-based requests limit.	
userMax	Number	Maximum number of requests per user per window.	
userWindowInMinutes	Number	Time window in minutes for the user-based requests limit.	
Example:
rateLimits

rateLimits:
  fileUploads:
    ipMax: 100
    ipWindowInMinutes: 60
    userMax: 50
    userWindowInMinutes: 60
  conversationsImport:
    ipMax: 100
    ipWindowInMinutes: 60
    userMax: 50
    userWindowInMinutes: 60
  stt:
    ipMax: 100
    ipWindowInMinutes: 1
    userMax: 50
    userWindowInMinutes: 1
  tts:
    ipMax: 100
    ipWindowInMinutes: 1
    userMax: 50
    userWindowInMinutes: 1
registration
Key:

Key	Type	Description	Example
registration	Object	Configures registration-related settings for the application.	
Subkeys:

Key	Type	Description	Example
socialLogins		Social login configurations.	
allowedDomains		Specifies allowed domains for registration.	
see also:

socialLogins,
alloweddomains,
Registration Object Structure
memory
Key:

Key	Type	Description	Example
memory	Object	Configures conversation memory and personalization features for the application.	
Subkeys:

Key	Type	Description	Example
disabled	Boolean	Disables memory functionality when set to true.	
validKeys	Array of Strings	Specifies which keys are valid for memory storage.	
tokenLimit	Number	Sets the maximum number of tokens for memory storage and processing.	
personalize	Boolean	Enables or disables personalization features.	
messageWindowSize	Number	Specifies the number of recent messages to include in memory context.	
agent	Object | Union	Configures the agent responsible for memory processing.	
see: Memory Object Structure

actions
Key:

Key	Type	Description	Example
actions	Object	Configures actions-related settings, used by Agents and Assistants	
Subkeys:

Key	Type	Description	Example
allowedDomains		Specifies allowed domains for actions.	
see also:

alloweddomains,
Actions Object Structure
interface
Key:

Key	Type	Description	Example
interface	Object	Configures user interface elements within the application, allowing for customization of visibility and behavior of various components.	
Subkeys:

Key	Type	Description	Example
privacyPolicy	Object	Contains settings related to the privacy policy link provided.	
termsOfService	Object	Contains settings related to the terms of service link provided.	
modelSelect	Boolean	Determines whether the model selection feature is available.	
parameters	Boolean	Toggles the visibility of parameter configuration options AKA conversation settings.	
sidePanel	Boolean	Controls the visibility of the right-most side panel.	
presets	Boolean	Enables or disables the presets menu	
prompts	Boolean	Enables or disables all prompt-related features for all users	
bookmarks	Boolean	Enables or disables all bookmarks-related features for all users	
multiConvo	Boolean	Enables or disables all "multi convo", AKA multiple response streaming, related features for all users	
agents	Boolean	Enables or disables all agents features for all users	
webSearch	Boolean	Enables or disables the web search button in the chat interface	
fileSearch	Boolean	Enables or disables the file search button in the chat interface	
temporaryChatRetention	Number	Configures the retention period for temporary chats in hours. Min: 1, Max: 8760. Default: 720 (30 days).	temporaryChatRetention: 168
see: Interface Object Structure

temporaryChatRetention
The temporaryChatRetention configuration allows you to customize how long temporary chats are retained before being automatically deleted. This setting applies to all temporary conversations created by users and provides flexible control over data retention policies.

Configuration Options:

Key	Type	Description	Example
temporaryChatRetention	Number	Sets the retention period for temporary chats in hours.	temporaryChatRetention: 168
Validation Rules:

Minimum: 1 hour (prevents immediate deletion)
Maximum: 8760 hours (1 year maximum retention)
Default: 720 hours (30 days)
Configuration Methods:

Environment Variable: TEMP_CHAT_RETENTION_HOURS=168
LibreChat.yaml: interface.temporaryChatRetention: 168
Priority: Config file takes precedence over environment variable
Example Configuration:

temporaryChatRetention

interface:
  # Retain temporary chats for 7 days (168 hours)
  temporaryChatRetention: 168
Common Retention Periods:

1 hour: temporaryChatRetention: 1 (minimal retention)
24 hours: temporaryChatRetention: 24 (1 day)
168 hours: temporaryChatRetention: 168 (1 week)
720 hours: temporaryChatRetention: 720 (30 days - default)
8760 hours: temporaryChatRetention: 8760 (1 year - maximum)
Important Notes:

Automatic cleanup occurs via MongoDB TTL (Time To Live) indexes
Changes apply only to newly created temporary chats
Existing temporary chats retain their original expiration dates
Invalid values automatically fallback to the default (720 hours)
Setting too low values may impact user experience with temporary chats
This setting only affects temporary chats, not regular conversations
modelSpecs
Key:

Key	Type	Description	Example
modelSpecs	Object	Configures model specifications, allowing for detailed setup and customization of AI models and their behaviors within the application.	
Subkeys:

Key	Type	Description	Example
enforce	Boolean	Determines whether the model specifications should strictly override other configuration settings.	
prioritize	Boolean	Specifies if model specifications should take priority over the default configuration when both are applicable.	
list	Array of Objects	Contains a list of individual model specifications detailing various configurations and behaviors.	
see: Model Specs Object Structure

endpoints
Key:

Key	Type	Description	Example
endpoints	Object	Defines custom API endpoints for the application.	
Subkeys:

Key	Type	Description	Example
custom	Array of Objects	Each object in the array represents a unique endpoint configuration.	
azureOpenAI	Object	Azure OpenAI endpoint-specific configuration	
assistants	Object	Assistants endpoint-specific configuration.	
azureAssistants	Object	Azure Assistants endpoint-specific configuration.	
agents	Object	Agents endpoint-specific configuration.	
all	Object	Global endpoint settings that apply to all endpoints. See Shared Endpoint Settings.	
Note: All endpoints support Shared Endpoint Settings which include streamRate, titleModel, titleMethod, titlePrompt, titlePromptTemplate, and titleEndpoint. These can be configured individually per endpoint or globally using the all key.

mcpServers
Key:

Key	Type	Description	Example
mcpServers	Object	Defines the configuration for Model Context Protocol (MCP) servers, allowing dynamic integration of MCP servers within the application.	
Subkeys:

Key	Type	Description	Example
<serverName>	Object	Each key under `mcpServers` represents an individual MCP server configuration, identified by a unique name.	
Notes:
Initialization happens at startup, and the app must be restarted for changes to take effect.
The <serverName> is a unique identifier for each MCP server configuration.
Each MCP server can be configured using one of four connection types:
stdio
websocket
sse
streamable-http
The type field specifies the connection type to the MCP server.
If type is omitted, it defaults based on the presence and format of url or command:
If url is specified and starts with http or https, type defaults to sse.
If url is specified and starts with ws or wss, type defaults to websocket.
If command is specified, type defaults to stdio.
Additional configuration options include:
timeout: Timeout in milliseconds for MCP server requests. Determines how long to wait for a response for tool requests.
initTimeout: Timeout in milliseconds for MCP server initialization. Determines how long to wait for the server to initialize.
serverInstructions: Controls whether server instructions are included in agent context. Can be true (use server-provided), false (disabled), or a custom string (overrides server-provided).
customUserVars: (Optional) Defines custom variables (e.g., API keys, URLs) that individual users can set for an MCP server. These per-user values, provided through the UI, can then be referenced in the server’s headers or env configurations using {{VARIABLE_NAME}} syntax. This allows for per-user authentication or customization for MCP tools.
see: MCP Servers Object Structure
Example:

mcpServers

mcpServers:
  everything:
    # type: sse # type can optionally be omitted
    url: http://localhost:3001/sse
    timeout: 30000
    initTimeout: 10000
    serverInstructions: true  # Use server-provided instructions
  puppeteer:
    type: stdio
    command: npx
    args:
      - -y
      - "@modelcontextprotocol/server-puppeteer"
    timeout: 30000
    initTimeout: 10000
    serverInstructions: "Do not access any local files or local/internal IP addresses"
  filesystem:
    # type: stdio
    command: npx
    args:
      - -y
      - "@modelcontextprotocol/server-filesystem"
      - /home/user/LibreChat/
    iconPath: /home/user/LibreChat/client/public/assets/logo.svg
  mcp-obsidian:
    command: npx
    args:
      - -y
      - "mcp-obsidian"
      - /path/to/obsidian/vault
  streamable-http-example:
    type: streamable-http
    url: https://example.com/mcp
    headers:
      Authorization: "Bearer ${API_TOKEN}"
    timeout: 30000
  per-user-crendentials-example:
    type: sse
    url: "https//some.mcp/sse"
    headers:
      X-Custom-Auth-Token: "{{USER_API_KEY}}" # Placeholder for the user-provided API key, defined in `customUserVars` below.
    customUserVars:
      USER_API_KEY:
        title: "Service API Key"
        description: "Your personal API key for this service. You can get it <a href='https://example.com/api-keys' target='_blank'>here</a>."
    serverInstructions: true
see: MCP Servers Object Structure