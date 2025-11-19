/// Module: bootcampcoin
module bootcampcoin::bootcampcoin;

use sui::coin_registry;


const TOTAL_SUPPLY: u64 = 1_000_000_000000000;
public struct BOOTCAMPCOIN has drop{}

fun init ( otw: BOOTCAMPCOIN, ctx: &mut TxContext){
    let (mut builder, mut treasury_cap) = coin_registry::new_currency_with_otw(otw, 9, b"CA".to_string(),
    b"CONTRACT ADDRESS COIN".to_string(),
     b"COME AGAIN BRO".to_string(),
      b"https://aggregator.walrus-testnet.walrus.space/v1/blobs/OQ7IfI3_j96LnMHBL9iVjhjaNAdn5bP3JsNBO6ja8q4".to_string(),
       ctx);

    let supply = treasury_cap.mint(TOTAL_SUPPLY, ctx);

    builder.make_supply_fixed(treasury_cap);

    let metadata_cap = builder.finalize(ctx);

    transfer::public_transfer(metadata_cap, ctx.sender());
    transfer::public_transfer(supply, ctx.sender());
   
}