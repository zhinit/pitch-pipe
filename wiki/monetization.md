# Monetization

Options for charging money for the pitch pipe app on the Connect IQ
Store.

## Garmin's official monetization system

Launched August 2024. Developers can set a price and sell apps directly
through the Connect IQ Store.

### Costs

- **Annual fee**: $100 USD, non-refundable
- **Commission**: Garmin takes 15% of the pre-tax price
- **Credit card fees**: Garmin covers them
- **Digital service taxes and currency conversion**: withheld from payouts

(source: connectiq-monetization-overview.md)

### Requirements

- Must complete merchant onboarding and trader verification
- Must pay the $100/year program fee
- **Apps must target CIQ System 7+** (API Level 5.0+)

(source: connectiq-monetization-overview.md)

### Pricing

Garmin controls pricing within fixed tiers. Minimum observed price is
$4.99. Prices are automatically adjusted across countries.

(source: connectiq-monetization-overview.md)

### Supported countries

US, Canada, UK, Germany, EU countries, Mexico, Australia, New Zealand.

(source: connectiq-monetization-overview.md)

### Buyer experience

- Any credit card accepted (not limited to Garmin Pay)
- Purchases are per-account, not per-device — works across all
  compatible devices
- 48-hour no-questions-asked refund

(source: connectiq-monetization-overview.md)

### Trial apps

A 30-day trial period is available. The Connect IQ API has a built-in
unlock mechanism. If offering a trial, communicate remaining time
clearly to the user.

(source: connectiq-monetization-best-practices.md)

## Impact on this project

The CIQ System 7 requirement (API 5.0+) is significant. Many of the
beeper devices in the manifest are pre-System 7:

**Cannot support paid purchase** (API < 5.0):
- fēnix 5, 5 Plus, 6 series (API 3.1–3.4)
- Forerunner 245/245M, 645, 935, 945, 745, 55 (API 3.1–3.4)
- Instinct 2 series, Crossover (API 3.4)
- MARQ Gen 1 (API 3.4)
- Venu (original), Venu Sq (API 3.3)
- vívoactive 3, 4 series (API 3.1–3.3)
- D2 Delta series, Descent Mk1/Mk2, Enduro (API 3.1–3.4)
- All special editions (Captain Marvel, etc.) (API 3.3)

**Can support paid purchase** (API 5.0+):
- fēnix 7 series, fēnix E (API 5.2–6.0)
- Forerunner 165, 170, 255, 265, 955, 965, 70 (API 5.1–6.0)
- epix Gen 2, epix Pro Gen 2 (API 5.2)
- Instinct 3 series, Instinct E, Crossover AMOLED (API 5.1)
- MARQ Gen 2 (API 5.2)
- Venu 2/2S, Venu Sq 2 (API 5.0)
- vívoactive 5, 6 (API 5.2–6.0)
- D2 Air X10, D2 Mach 1/2 (API 5.0–5.2)
- Descent G2, Mk3 (API 5.1)
- Enduro 3 (API 6.0)
- Approach S50, S70 (API 5.1)

If the app is paid, users on older devices would see it in the store but
couldn't buy it. If the app is free, it works on all 106 devices.

## Break-even math

At $4.99 with 15% Garmin cut, the developer keeps ~$4.24 per sale.
To cover the $100/year fee: need ~24 sales/year.

(source: connectiq-monetization-overview.md)

## Alternative: publish free

No fee, no merchant onboarding, works on all devices including
pre-System 7. The app can be downloaded and used immediately by anyone.

## Alternative: external payment (legacy)

Before Garmin's system, developers used PayPal links and activation
codes. Garmin does not review or manage these. This still works but
provides a worse user experience.

(source: connectiq-monetization-overview.md)

See also: [[publishing-to-store]], [[multi-device-compatibility]]
