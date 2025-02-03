<script lang="ts">
  import { onMount } from "svelte";

  import ScanbotSDK from "scanbot-web-sdk/UI";

  let scanResult = $state();

  onMount(async () => {
    //const reference = (await import('scanbot-web-sdk/UI')).default;
    const sdk = await ScanbotSDK.initialize({
      licenseKey: "",
      enginePath: "/wasm/",
    });
  });

  const startBarcodeScanner = async () => {
    const config = new ScanbotSDK.UI.Config.BarcodeScannerScreenConfiguration();

    config.palette.sbColorPrimary = "#1E90FF";
    config.palette.sbColorSecondary = "#87CEEB";

    config.userGuidance.title.text = "Place the finder over the barcode";

    config.topBar.mode = "GRADIENT";

    config.actionBar.zoomButton.backgroundColor = "#1E90FF";

    const useCase = new ScanbotSDK.UI.Config.MultipleScanningMode();
    useCase.arOverlay.visible = true;
    useCase.arOverlay.automaticSelectionEnabled = false;
    config.useCase = useCase;

    const result = await ScanbotSDK.UI.createBarcodeScanner(config);

    if (result && result.items.length > 0) {
      scanResult = result.items[0].barcode.text;
    }
  };
</script>

<main>
  <div>
    <h1>Scanbot Svelte Example</h1>
  </div>

  <div class="card">
    <button onclick={startBarcodeScanner}> Scan Barcodes </button>
  </div>

  <p>{scanResult}</p>
</main>
