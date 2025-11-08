module eventticket::event_ticket {
    use sui::event;
    use std::ascii;

    // Event when ticket is created or issued
    public struct TicketEvent has copy, drop {
        event_name: ascii::String,
        seat_number: u64,
        owner: address,
    }

    // NEW: Event when ticket ownership changes
    public struct TicketTransferEvent has copy, drop {
        event_name: ascii::String,
        seat_number: u64,
        from: address,
        to: address,
    }

    public fun emit_ticket_event(
        event_name: ascii::String,
        seat_number: u64,
        owner: address
    ) {
        event::emit(TicketEvent {
            event_name,
            seat_number,
            owner,
        });
    }

    // NEW FUNCTION for transfer events
    public fun emit_ticket_transfer_event(
        event_name: ascii::String,
        seat_number: u64,
        from: address,
        to: address
    ) {
        event::emit(TicketTransferEvent {
            event_name,
            seat_number,
            from,
            to,
        });
    }
}
